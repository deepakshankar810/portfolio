// public/js/main.js

// --- Canvas Animation Logic (Bio Network) ---
const canvas = document.getElementById('bio-canvas');
const ctx = canvas.getContext('2d');
let particles = [];
let width, height;
let isDark = document.documentElement.classList.contains('dark');

// Resize Canvas
function resize() {
    const dpr = window.devicePixelRatio || 1;
    width = window.innerWidth;
    height = window.innerHeight;
    
    // Set display size
    canvas.style.width = width + 'px';
    canvas.style.height = height + 'px';
    
    // Set actual resolution
    canvas.width = width * dpr;
    canvas.height = height * dpr;
    
    // Scale context to match actual resolution
    ctx.scale(dpr, dpr);
}
window.addEventListener('resize', () => {
    resize();
    initParticles(); // Re-init particles on resize to fit new dimensions
});
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

// CV Preview Modal
function openCVPreview() {
    const modal = document.getElementById('cv-preview-modal');
    if (modal) {
        // Force iframe to reload by appending a unique timestamp
        const iframe = modal.querySelector('iframe');
        if (iframe) {
            // Keep the base URL but append/update the v parameter
            iframe.src = './CV/Deepak_CV.pdf?v=' + new Date().getTime();
        }
        
        modal.classList.remove('hidden');
        setTimeout(() => {
            modal.querySelector('.cv-modal-backdrop').style.opacity = '1';
            modal.querySelector('.cv-modal-panel').style.opacity = '1';
            modal.querySelector('.cv-modal-panel').style.transform = 'scale(1)';
        }, 10);
    }
}

function closeCVPreview() {
    const modal = document.getElementById('cv-preview-modal');
    if (modal) {
        modal.querySelector('.cv-modal-backdrop').style.opacity = '0';
        modal.querySelector('.cv-modal-panel').style.opacity = '0';
        modal.querySelector('.cv-modal-panel').style.transform = 'scale(0.95)';
        setTimeout(() => {
            modal.classList.add('hidden');
        }, 300);
    }
}

document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
        closeCVPreview();
        document.querySelectorAll('.fixed.inset-0:not(.hidden)').forEach(m => closeModal(m.id));
    }
});

// --- Custom Cursor Tracking ---
const cursorDot = document.querySelector('.cursor');

if (cursorDot) {
    let cursorX = 0;
    let cursorY = 0;

    window.addEventListener('mousemove', (e) => {
        cursorX = e.clientX;
        cursorY = e.clientY;
        
        cursorDot.style.left = cursorX + 'px';
        cursorDot.style.top = cursorY + 'px';

        // Ensure cursor is visible when moving
        if (cursorDot.style.opacity === '0' || cursorDot.style.opacity === '') {
            cursorDot.style.opacity = '1';
        }
    });

    // Hide cursor when mouse leaves the window
    document.addEventListener('mouseleave', () => {
        cursorDot.style.opacity = '0';
    });

    // Show cursor when mouse enters the window
    document.addEventListener('mouseenter', () => {
        cursorDot.style.opacity = '1';
    });


    // Hover effects for interactive elements
    const interactiveElements = 'a, button, [onclick], .cursor-pointer, input, textarea, select';
    
    // Use event delegation for hover effects to handle dynamic content reliably
    document.addEventListener('mouseover', (e) => {
        const target = e.target.closest(interactiveElements);
        if (target) {
            cursorDot.classList.add('active');
        }
    });

    document.addEventListener('mouseout', (e) => {
        const target = e.target.closest(interactiveElements);
        const relatedTarget = e.relatedTarget ? e.relatedTarget.closest(interactiveElements) : null;
        
        // Only remove active class if we're not moving to another interactive element
        if (target && target !== relatedTarget) {
            cursorDot.classList.remove('active');
        }
    });
    
    // Hide cursor when over iframes (like the CV preview) where tracking is restricted
    function addIframeListeners() {
        document.querySelectorAll('iframe').forEach(iframe => {
            if (!iframe.dataset.cursorBound) {
                iframe.addEventListener('mouseenter', () => {
                    cursorDot.style.opacity = '0';
                });
                iframe.addEventListener('mouseleave', () => {
                    cursorDot.style.opacity = '1';
                });
                iframe.dataset.cursorBound = "true";
            }
        });
    }
    
    addIframeListeners();
    
    // Re-run on potential dynamic content or tab switches
    const observer = new MutationObserver(() => {
        addIframeListeners();
    });
    observer.observe(document.body, { childList: true, subtree: true });
}