// public/js/main.js

// --- Canvas Animation Logic (Bio Network) ---
const canvas = document.getElementById('bio-canvas');
const ctx = canvas.getContext('2d');
let particles = [];
let width, height;
let isDark = document.documentElement.classList.contains('dark');

// Resize Canvas
function resize() {
    width = canvas.width = window.innerWidth;
    height = canvas.height = window.innerHeight;
}
window.addEventListener('resize', resize);
resize();

// Mouse Interaction
let mouse = { x: null, y: null };
window.addEventListener('mousemove', (e) => {
    mouse.x = e.x;
    mouse.y = e.y;
});

// Particle Class
class Particle {
    constructor() {
        this.x = Math.random() * width;
        this.y = Math.random() * height;
        this.vx = (Math.random() - 0.5) * 0.5;
        this.vy = (Math.random() - 0.5) * 0.5;
        this.size = Math.random() * 2 + 1;
    }
    update() {
        this.x += this.vx;
        this.y += this.vy;

        if (this.x < 0) this.x = width;
        if (this.x > width) this.x = 0;
        if (this.y < 0) this.y = height;
        if (this.y > height) this.y = 0;

        if (mouse.x != null) {
            let dx = mouse.x - this.x;
            let dy = mouse.y - this.y;
            let distance = Math.sqrt(dx * dx + dy * dy);
            if (distance < 100) {
                this.x -= dx / 20;
                this.y -= dy / 20;
            }
        }
    }
    draw() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fillStyle = isDark ? 'rgba(45, 212, 191, 0.5)' : 'rgba(13, 148, 136, 0.5)';
        ctx.fill();
    }
}

function initParticles() {
    particles = [];
    let count = (width * height) / 15000;
    for (let i = 0; i < count; i++) particles.push(new Particle());
}
initParticles();

function animate() {
    ctx.clearRect(0, 0, width, height);

    for (let i = 0; i < particles.length; i++) {
        for (let j = i; j < particles.length; j++) {
            let dx = particles[i].x - particles[j].x;
            let dy = particles[i].y - particles[j].y;
            let distance = Math.sqrt(dx * dx + dy * dy);

            if (distance < 120) {
                ctx.beginPath();
                let alpha = 1 - distance / 120;
                // Standard JS string concatenation
                ctx.strokeStyle = isDark ? 'rgba(45, 212, 191, ' + alpha + ')' : 'rgba(13, 148, 136, ' + alpha + ')';
                ctx.lineWidth = 0.5;
                ctx.moveTo(particles[i].x, particles[i].y);
                ctx.lineTo(particles[j].x, particles[j].y);
                ctx.stroke();
            }
        }
        particles[i].update();
        particles[i].draw();
    }
    requestAnimationFrame(animate);
}
animate();

// Theme Toggle Logic
function toggleTheme() {
    const html = document.documentElement;
    const icon = document.getElementById('theme-icon');

    if (html.classList.contains('dark')) {
        html.classList.remove('dark');
        icon.classList.remove('fa-sun');
        icon.classList.add('fa-moon');
        localStorage.setItem('theme', 'light');
        isDark = false;
    } else {
        html.classList.add('dark');
        icon.classList.remove('fa-moon');
        icon.classList.add('fa-sun');
        localStorage.setItem('theme', 'dark');
        isDark = true;
    }
}

// Initialize Theme
(function () {
    const icon = document.getElementById('theme-icon');
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark');
        isDark = true;
        if (icon) {
            icon.classList.remove('fa-moon');
            icon.classList.add('fa-sun');
        }
    } else {
        document.documentElement.classList.remove('dark');
        isDark = false;
        if (icon) {
            icon.classList.remove('fa-sun');
            icon.classList.add('fa-moon');
        }
    }
})();

// Tab Switching
// Note: basic switchTab is now handled inline in app.jl for faster response
// Extra logic like 'pop-in' effect below:
function viewMyWork() {
    const targets = ['projects', 'manuscripts'];
    const randomTarget = targets[Math.floor(Math.random() * targets.length)];
    if (typeof switchTab === 'function') switchTab(randomTarget, 'pop-in');
}

// Modals
function openModal(id) {
    const modal = document.getElementById(id);
    if (modal) {
        modal.classList.remove('hidden');
        setTimeout(() => {
            modal.querySelector('.modal-backdrop').style.opacity = '1';
            modal.querySelector('.modal-panel').style.opacity = '1';
            modal.querySelector('.modal-panel').style.transform = 'scale(1)';
        }, 10);
    }
}

function closeModal(id) {
    const modal = document.getElementById(id);
    if (modal) {
        modal.querySelector('.modal-backdrop').style.opacity = '0';
        modal.querySelector('.modal-panel').style.opacity = '0';
        modal.querySelector('.modal-panel').style.transform = 'scale(0.95)';

        setTimeout(() => {
            modal.classList.add('hidden');
        }, 300);
    }
}

document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
        document.querySelectorAll('.fixed.inset-0:not(.hidden)').forEach(m => closeModal(m.id));
    }
});