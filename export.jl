# export.jl
using Genie
using Genie.Router
using Genie.Renderer.Html

# 1. Define a dummy html function that just returns the string
# This overrides Genie's html() so we get raw text for the file
function html(content::String; kwargs...)
    return content
end

# 2. Load your main portfolio file
# (Ensure the last line 'up()' in portfolio.jl is commented out!)
include("app.jl") 

# 3. Generate the HTML string
println("Genering HTML...")
content = home()

# 4. Write it to index.html
open("index.html", "w") do file
    write(file, content)
end

println("✅ Successfully generated index.html!")