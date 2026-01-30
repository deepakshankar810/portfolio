# src/components.jl

function render_edu(edu)
    """
    <div class="mb-8 ml-6 group">
        <span class="absolute flex items-center justify-center w-6 h-6 bg-teal-600 rounded-full -left-3 ring-4 ring-white dark:ring-gray-900 group-hover:bg-teal-400 transition">
            <i class="fas fa-graduation-cap text-xs text-white"></i>
        </span>
        <div class="glass dark:bg-slate-800/50 p-5 rounded-lg shadow-sm border border-gray-200 dark:border-slate-700 hover:shadow-lg hover:border-teal-200 dark:hover:border-teal-500/30 transition transform hover:scale-[1.02]">
            <time class="block mb-2 text-sm font-bold leading-none text-teal-600 dark:text-teal-400">$(edu["time"])</time>
            <h3 class="text-lg font-bold text-gray-800 dark:text-gray-100">$(edu["degree"])</h3>
            <p class="text-base font-normal text-gray-600 dark:text-gray-400 mt-1">$(edu["inst"])</p>
        </div>
    </div>
    """
end

function render_experience(exp)
    """
    <div class="mb-8 ml-6 group">
        <span class="absolute flex items-center justify-center w-6 h-6 bg-teal-600 rounded-full -left-3 ring-4 ring-white dark:ring-gray-900 group-hover:bg-teal-400 transition">
            <i class="fas fa-briefcase text-xs text-white"></i>
        </span>
        <div class="glass dark:bg-slate-800/50 p-5 rounded-lg shadow-sm border border-gray-200 dark:border-slate-700 hover:shadow-lg hover:border-teal-200 dark:hover:border-teal-500/30 transition transform hover:scale-[1.02]">
            <time class="block mb-2 text-sm font-bold leading-none text-teal-600 dark:text-teal-400">$(exp["time"])</time>
            <h3 class="text-lg font-bold text-gray-800 dark:text-gray-100">$(exp["role"])</h3>
            <p class="text-base font-normal text-gray-600 dark:text-gray-400 mt-1">$(exp["company"])</p>
        </div>
    </div>
    """
end

function render_skill_card(i, skill)
    """
    <div onclick="openModal('skill_$(i)')" class="glass dark:bg-slate-800/50 p-8 rounded-2xl cursor-pointer group transition-all duration-300 hover:-translate-y-2 hover:shadow-xl hover:shadow-teal-100 dark:hover:shadow-teal-900/20">
        <div class="flex justify-between items-start mb-6">
            <i class="fas $(skill["icon"]) text-4xl text-gray-400 dark:text-gray-400 group-hover:text-teal-500 dark:group-hover:text-teal-400 transition-colors"></i>
        </div>
        <h3 class="text-xl font-bold text-gray-800 dark:text-gray-100 mb-2">$(skill["category"])</h3>
        <p class="text-teal-600 dark:text-teal-400 text-sm font-mono font-bold">$(skill["count"])</p>
    </div>
    """
end

function render_project_card(proj)
    """
    <div onclick="openModal('$(proj["id"])')" class="glass dark:bg-slate-800/50 p-8 rounded-2xl relative overflow-hidden group cursor-pointer border-t-4 border-t-teal-500 hover:shadow-xl hover:shadow-teal-100 dark:hover:shadow-teal-900/20 transition-all duration-300">
        <div class="relative z-10">
            <div class="flex justify-between items-start mb-4">
                <i class="fas $(proj["icon"]) text-4xl text-teal-500"></i>
                <i class="fas fa-arrow-right text-gray-400 dark:text-gray-500 group-hover:text-teal-500 dark:group-hover:text-teal-400 transition"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 dark:text-gray-100 mb-3 group-hover:text-teal-600 dark:group-hover:text-teal-400 transition leading-snug">$(proj["title"])</h3>
            <p class="text-sm text-teal-600 dark:text-teal-400 font-bold mb-4 uppercase tracking-wide">$(proj["subtitle"])</p>
            <p class="text-gray-600 dark:text-gray-400 line-clamp-3">$(proj["summary"])</p>
        </div>
    </div>
    """
end

function render_manuscript_card(manu)
    badge_class = "bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400"

    link_html = ""
    if haskey(manu, "link")
        link_html = """
        <a href="$(manu["link"])" target="_blank" onclick="event.stopPropagation()" class="flex items-center text-teal-600 dark:text-teal-400 hover:text-teal-800 dark:hover:text-white transition z-20 px-3 py-1 border border-teal-200 dark:border-teal-500/30 rounded-md hover:bg-teal-50 dark:hover:bg-teal-500/20 text-xs font-bold uppercase tracking-wider">
            <i class="fas fa-external-link-alt mr-2"></i> Live Tool
        </a>
        """
    end

    """
    <div onclick="openModal('$(manu["id"])')" class="glass dark:bg-slate-800/50 p-6 rounded-xl cursor-pointer hover:shadow-lg transition border-l-4 border-l-purple-500 flex flex-col h-full hover:-translate-y-1">
        <div class="flex justify-between items-center mb-3">
            <span class="text-xs font-bold px-2 py-1 rounded $badge_class">$(manu["type"])</span>
        </div>
        <h3 class="text-lg font-bold text-gray-800 dark:text-gray-100 leading-snug mb-4 hover:text-teal-600 dark:hover:text-teal-400 transition">$(manu["title"])</h3>
        
        <div class="mt-auto flex items-center justify-between">
            <p class="text-sm text-gray-500 dark:text-gray-400 flex items-center"><i class="fas fa-info-circle mr-2"></i> Click for details</p>
            $link_html
        </div>
    </div>
    """
end

function render_cert_card(cert)
    """
    <div onclick="openModal('$(cert["id"])')" class="glass dark:bg-slate-800/50 p-6 rounded-xl text-center cursor-pointer shadow-sm hover:shadow-lg hover:shadow-teal-100 dark:hover:shadow-teal-900/20 hover:-translate-y-1 transition h-full flex flex-col items-center justify-center">
        <i class="fas $(cert["icon"]) text-4xl text-yellow-500 mb-4"></i>
        <h3 class="font-bold text-gray-800 dark:text-gray-100 mb-2 text-lg">$(cert["title"])</h3>
        <p class="text-xs text-gray-500 dark:text-gray-400">$(cert["subtitle"])</p>
    </div>
    """
end

function render_modal(id, title, points)
    list_items = join(["<li class='flex items-start mb-3 opacity-0 animate-slide-in' style='animation-delay: $(i*100)ms'><i class='fas fa-check-circle text-teal-500 dark:text-teal-400 mt-1 mr-3 text-sm flex-shrink-0'></i><span class='text-gray-600 dark:text-gray-300 text-sm text-justify'>$p</span></li>" for (i, p) in enumerate(points)], "")

    """
    <div id="$id" class="fixed inset-0 z-[60] hidden" role="dialog" aria-modal="true">
        <div class="absolute inset-0 bg-gray-900/50 dark:bg-black/80 backdrop-blur-sm transition-opacity duration-300 opacity-0 modal-backdrop" onclick="closeModal('$id')"></div>
        <div class="absolute inset-0 flex items-center justify-center p-4 pointer-events-none">
            <div class="bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 w-full max-w-2xl rounded-2xl shadow-2xl transform transition-all duration-300 scale-95 opacity-0 modal-panel pointer-events-auto max-h-[90vh] flex flex-col">
                <div class="p-6 border-b border-gray-100 dark:border-slate-700 flex justify-between items-start shrink-0">
                    <h3 class="text-xl font-bold text-teal-600 dark:text-teal-400 pr-8">$title</h3>
                    <button onclick="closeModal('$id')" class="text-gray-400 hover:text-gray-600 dark:hover:text-white transition"><i class="fas fa-times"></i></button>
                </div>
                <div class="p-6 overflow-y-auto custom-scrollbar">
                    <h4 class="text-sm uppercase tracking-wider text-gray-400 dark:text-gray-500 font-semibold mb-4">Key Details</h4>
                    <ul class="space-y-2">$list_items</ul>
                </div>
                <div class="p-4 border-t border-gray-100 dark:border-slate-700 bg-gray-50 dark:bg-slate-800/50 rounded-b-2xl flex justify-end shrink-0">
                    <button onclick="closeModal('$id')" class="px-4 py-2 bg-gray-200 dark:bg-slate-700 hover:bg-gray-300 dark:hover:bg-slate-600 text-gray-700 dark:text-gray-200 rounded-lg text-sm font-medium transition">Close</button>
                </div>
            </div>
        </div>
    </div>
    """
end