# app.jl
using Genie
using Genie.Router
using Genie.Renderer.Html

# Load Data and Logic
include("data/content.jl")
include("src/components.jl")

# Define the UI
function home()
    # Generate HTML blocks using components
    exp_html = join([render_experience(exp) for exp in EXPERIENCE], "")
    edu_html = join([render_edu(edu) for edu in EDUCATION], "")
    skill_html = join([render_skill_card(i, skill) for (i, skill) in enumerate(SKILLS)], "")
    proj_html = join([render_project_card(p) for p in PROJECTS], "")
    manu_html = join([render_manuscript_card(m) for m in MANUSCRIPTS], "")
    cert_html = join([render_cert_card(c) for c in CERTS], "")

    # Generate Modals
    modals_skill = join([render_modal("skill_$i", s["category"], s["items"]) for (i, s) in enumerate(SKILLS)], "")
    modals_proj = join([render_modal(p["id"], p["title"], p["points"]) for p in PROJECTS], "")
    modals_manu = join([render_modal(m["id"], m["title"], m["points"]) for m in MANUSCRIPTS], "")
    modals_cert = join([render_modal(c["id"], c["title"], c["points"]) for c in CERTS], "")

    # Return the full HTML
    html("""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>$(PROFILE["name"])</title>
        <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>💻</text></svg>">
        
        <!-- External Libraries -->
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <!-- Custom CSS -->
        <link rel="stylesheet" href="./css/style.css">

        <!-- Tailwind Dark Mode Config -->
        <script>
            tailwind.config = {
                darkMode: 'class',
                theme: {
                    extend: {
                        colors: {
                            slate: { 850: '#151f32' }
                        }
                    }
                }
            }
        </script>

        <style>
            /* Hide Scrollbar for Mobile Nav */
            .no-scrollbar::-webkit-scrollbar { display: none; }
            .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
            
            /* Mask gradient for scrollable nav on mobile */
            .mask-gradient {
                -webkit-mask-image: linear-gradient(to right, black 90%, transparent 100%);
                mask-image: linear-gradient(to right, black 90%, transparent 100%);
            }

            /* Floating Animation Logic - Restored */
            @keyframes float {
                0% { transform: translateY(0px); }
                50% { transform: translateY(-10px); }
                100% { transform: translateY(0px); }
            }
            .floating {
                animation: float 3s ease-in-out infinite;
            }
        </style>
    </head>
    <body class="antialiased overflow-hidden h-screen h-[100dvh] flex flex-col bg-slate-50 dark:bg-[#0B1120] text-slate-700 dark:text-slate-300">
        
        <!-- Nav -->
        <nav class="w-full z-50 bg-white/90 dark:bg-[#0B1120]/90 backdrop-blur-md border-b border-gray-200 dark:border-gray-800 flex-shrink-0 relative">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex items-center justify-between h-20">
                    
                    <!-- LEFT SIDE: Scrollable Tabs -->
                    <div class="flex-1 flex items-center overflow-x-auto no-scrollbar mask-gradient mr-4">
                        <div class="flex space-x-1 md:space-x-6">
                            <button onclick="switchTab('home')" class="nav-btn active text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">Home</button>
                            <button onclick="switchTab('about')" class="nav-btn text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">About</button>
                            <button onclick="switchTab('skills')" class="nav-btn text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">Skills</button>
                            <button onclick="switchTab('projects')" class="nav-btn text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">Projects</button>
                            <button onclick="switchTab('manuscripts')" class="nav-btn text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">Manuscripts</button>
                            <button onclick="switchTab('certifications')" class="nav-btn text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">Certifications</button>
                            <button onclick="switchTab('contact')" class="nav-btn text-gray-500 dark:text-gray-400 hover:text-teal-600 dark:hover:text-teal-400 transition px-3 py-2 text-sm font-medium whitespace-nowrap">Contact</button>
                        </div>
                    </div>

                    <!-- RIGHT SIDE: Theme Switcher -->
                    <div class="flex-shrink-0 pl-4 border-l border-gray-200 dark:border-gray-700">
                        <button onclick="toggleTheme()" class="p-2 rounded-full hover:bg-gray-200 dark:hover:bg-gray-800 transition focus:outline-none transform hover:scale-110 active:scale-95" title="Toggle Theme">
                            <i id="theme-icon" class="fas fa-moon text-teal-600 dark:text-teal-400 text-xl md:text-2xl"></i>
                        </button>
                    </div>

                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="flex-grow relative overflow-y-scroll custom-scrollbar w-full">
            
            <!-- CANVAS BG -->
            <canvas id="bio-canvas" class="fixed inset-0 w-full h-full pointer-events-none z-0"></canvas>

            <!-- HOME -->
            <div id="tab-home" class="tab-pane min-h-full flex items-center justify-center p-4 fade-in relative z-10">
                <div class="text-center w-full max-w-4xl">
                    <h1 class="text-5xl md:text-7xl font-bold text-gray-900 dark:text-white mb-4 animate-slide-in">$(PROFILE["name"])</h1>
                    <h2 class="text-3xl md:text-5xl font-bold text-gray-600 dark:text-gray-400 mb-6 animate-slide-in" style="animation-delay: 0.1s">$(PROFILE["title"])</h2>
                    <p class="text-lg text-gray-500 dark:text-gray-400 mb-10 w-full mx-auto animate-slide-in" style="animation-delay: 0.2s">$(PROFILE["tagline"])</p>
                    
                    <div class="flex justify-center space-x-8 animate-slide-in" style="animation-delay: 0.3s">
                        <a href="$(PROFILE["github"])" target="_blank" class="text-3xl text-gray-400 dark:text-gray-500 hover:text-teal-600 dark:hover:text-teal-400 transition transform hover:scale-110 floating" style="animation-delay: 0s"><i class="fab fa-github"></i></a>
                        <a href="$(PROFILE["linkedin"])" target="_blank" class="text-3xl text-gray-400 dark:text-gray-500 hover:text-teal-600 dark:hover:text-teal-400 transition transform hover:scale-110 floating" style="animation-delay: 0.5s"><i class="fab fa-linkedin"></i></a>
                        <a href="mailto:$(PROFILE["email"])" class="text-3xl text-gray-400 dark:text-gray-500 hover:text-teal-600 dark:hover:text-teal-400 transition transform hover:scale-110 floating" style="animation-delay: 1s"><i class="fas fa-envelope"></i></a>
                    </div>
                    
                    <div class="mt-12 animate-slide-in" style="animation-delay: 0.4s">
                         <button onclick="viewMyWork()" class="px-8 py-3 bg-teal-600 hover:bg-teal-700 dark:hover:bg-teal-500 text-white rounded-full font-bold transition shadow-lg shadow-teal-600/20 transform hover:scale-105 active:scale-95">View My Work</button>
                    </div>
                </div>
            </div>

            <!-- ABOUT -->
            <div id="tab-about" class="tab-pane hidden p-6 md:p-12 max-w-6xl mx-auto fade-in relative z-10 pb-32">
                <div class="grid md:grid-cols-2 gap-12">
                    <div class="space-y-6">
                        <h2 class="text-3xl font-bold text-teal-700 dark:text-teal-400 mb-6 border-b border-gray-200 dark:border-gray-700 pb-2">About Me</h2>
                        <div class="space-y-4">
                            <p class="text-gray-600 dark:text-gray-400 leading-relaxed text-justify">$(ABOUT["p1"])</p>
                            <p class="text-gray-600 dark:text-gray-400 leading-relaxed text-justify">$(ABOUT["p2"])</p>
                            <p class="text-gray-600 dark:text-gray-400 leading-relaxed text-justify">$(ABOUT["p3"])</p>
                            <p class="text-gray-600 dark:text-gray-400 leading-relaxed text-justify">$(ABOUT["p4"])</p>
                        </div>
                    </div>
                    <div>
                        <h2 class="text-3xl font-bold text-teal-700 dark:text-teal-400 mb-6 border-b border-gray-200 dark:border-gray-700 pb-2">Experience</h2>
                        <div class="relative border-l-2 border-gray-300 dark:border-gray-700 ml-3 space-y-10">
                            $exp_html
                        </div>
                        <h2 class="text-3xl font-bold text-teal-700 dark:text-teal-400 mb-6 border-b border-gray-200 dark:border-gray-700 pb-2 mt-12">Education</h2>
                        <div class="relative border-l-2 border-gray-300 dark:border-gray-700 ml-3 space-y-10">
                            $edu_html
                        </div>
                    </div>
                </div>
            </div>

            <!-- SKILLS -->
            <div id="tab-skills" class="tab-pane hidden p-6 md:p-12 max-w-7xl mx-auto fade-in relative z-10 pb-32">
                <h2 class="text-3xl font-bold text-center text-teal-700 dark:text-teal-400 mb-12">Technical Skills</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    $skill_html
                </div>
            </div>

            <!-- PROJECTS -->
            <div id="tab-projects" class="tab-pane hidden p-6 md:p-12 max-w-7xl mx-auto fade-in relative z-10 pb-32">
                <h2 class="text-3xl font-bold text-center text-teal-700 dark:text-teal-400 mb-12">Projects</h2>
                <div class="grid md:grid-cols-2 gap-8">
                    $proj_html
                </div>
            </div>

            <!-- MANUSCRIPTS -->
            <div id="tab-manuscripts" class="tab-pane hidden p-6 md:p-12 max-w-7xl mx-auto fade-in relative z-10 pb-32">
                <h2 class="text-3xl font-bold text-center text-teal-700 dark:text-teal-400 mb-12">Manuscripts</h2>
                <div class="grid md:grid-cols-2 gap-6">
                    $manu_html
                </div>
            </div>

            <!-- CERTIFICATIONS -->
            <div id="tab-certifications" class="tab-pane hidden p-6 md:p-12 max-w-7xl mx-auto fade-in relative z-10 pb-32">
                <h2 class="text-3xl font-bold text-center text-teal-700 dark:text-teal-400 mb-12">Certifications</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    $cert_html
                </div>
            </div>

            <!-- CONTACT -->
            <div id="tab-contact" class="tab-pane hidden min-h-full flex flex-col items-center justify-center p-4 fade-in relative z-10">
                <div class="text-center max-w-2xl glass dark:bg-slate-800/50 p-10 rounded-2xl shadow-xl">
                    <h2 class="text-4xl font-bold text-gray-800 dark:text-gray-100 mb-6 animate-slide-in" style="animation-delay: 0.1s">Get In Touch</h2>
                    <p class="text-gray-600 dark:text-gray-400 text-lg mb-8 animate-slide-in" style="animation-delay: 0.2s">
                        I'm always open to discussing new ideas, collaborating on projects, or just chatting about biotechnology and data science. 
                        Whether you have a question or just want to say hi, my inbox is always open!
                    </p>
                    <div class="animate-slide-in" style="animation-delay: 0.3s">
                        <a href="mailto:$(PROFILE["email"])" class="inline-flex items-center px-8 py-4 border-2 border-teal-500 text-teal-600 dark:text-teal-400 font-bold rounded-lg hover:bg-teal-500 hover:text-white transition duration-300 transform hover:-translate-y-1">
                            <i class="fas fa-paper-plane mr-2"></i> Say Hello
                        </a>
                    </div>
                    
                    <div class="mt-12 pt-8 border-t border-gray-100 dark:border-slate-700 flex justify-center space-x-8 animate-slide-in" style="animation-delay: 0.4s">
                        <a href="$(PROFILE["github"])" class="text-gray-400 hover:text-gray-800 dark:hover:text-white transition"><i class="fab fa-github text-2xl"></i></a>
                        <a href="$(PROFILE["linkedin"])" class="text-gray-400 hover:text-gray-800 dark:hover:text-white transition"><i class="fab fa-linkedin text-2xl"></i></a>
                    </div>
                </div>
            </div>

        </main>

        <!-- Modals -->
        $modals_skill
        $modals_proj
        $modals_manu
        $modals_cert

        <!-- Custom JS -->
        <script src="./js/main.js"></script>

        <script>
            // Reset scroll to top on tab switch
            function switchTab(tabId, animClass = 'fade-in') {
                document.querySelectorAll('.tab-pane').forEach(el => {
                    el.classList.add('hidden');
                    el.classList.remove('fade-in', 'pop-in');
                });
                
                const target = document.getElementById('tab-' + tabId);
                if(target) {
                    target.classList.remove('hidden');
                    void target.offsetWidth;
                    target.classList.add(animClass);
                }
                
                // Reset scroll
                const main = document.querySelector('main');
                if(main) main.scrollTop = 0;
                
                document.querySelectorAll('.nav-btn').forEach(btn => btn.classList.remove('active'));
                
                const buttons = document.querySelectorAll('.nav-btn');
                buttons.forEach(btn => {
                    if(btn.innerText.toLowerCase() === tabId) {
                        btn.classList.add('active');
                    }
                });
            }
        </script>
    </body>
    </html>
    """)
end

# Start Server
# route("/", home)
# up(8000, async=false)