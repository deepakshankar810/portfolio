# data/content.jl

const EXPERIENCE = [
    Dict(
        "company" => "Clarivate, Chennai",
        "role" => "Associate STEM Content Analyst - GENESEQ Indexing",
        "time" => "Jan 2026 – Present",
        "location" => "",
        "points" => []
    )
]

const PROFILE = Dict(
    "name" => "Deepak S P",
    "title" => "Associate STEM Content Analyst",
    "tagline" => "GENESEQ Indexing at Clarivate | Bridging Biotechnology, Genetics & Data Science 🧬💻",
    "email" => "deepakshankar810@gmail.com",
    "github" => "https://github.com/deepakshankar810",
    "linkedin" => "https://www.linkedin.com/in/deepak-s-p-rs7176005/"
)

const ABOUT = Dict(
    "p1" => "I am currently working as an Associate STEM Content Analyst – GENESEQ Indexing at Clarivate, where I apply biotechnology, genetics and bioinformatics expertise to curate, interpret and index biological sequence information from patent documents ensuring high standards of accuracy, consistency and data integrity.",
    "p2" => "With a strong foundation in molecular biology, microbiology, genetics and computational biology, I bring hands-on experience in PCR-based gene profiling, SNP analysis, microbial screening and sequence-focused data analysis. I am skilled in extracting, validating and organizing complex biological and sequence-related information and working with scientific databases and structured documentation. My technical expertise also includes computational techniques such as homology modelling, molecular docking and protein–ligand interaction analysis.",
    "p3" => "I have contributed to multidisciplinary projects ranging from SNP analysis in breast cancer, virulence gene profiling in Enterococcus faecalis and comparative protein–ligand interaction studies to developing machine learning models for hepatitis B progression and diabetic complications. I also assisted in the development of juProt, an open-source Julia-based tool for comparative protein–ligand interaction analysis. My experience spans both wet-lab experimentation and computational, data-driven research enabling me to effectively bridge laboratory science with bioinformatics and analytical workflows.",
    "p4" => "I am particularly focused on biological data curation, sequence annotation, and transforming complex scientific information into reliable, high-quality knowledge resources that support intellectual property insights and research. I also integrate data science and computational approaches to build efficient, scalable and well-structured solutions in bioinformatics and translational biology, contributing to advancements in biotechnology that improve human health and sustainability."
)

const EDUCATION = [
    Dict("degree" => "Master of Science in Biotechnology", "time" => "Aug 2023 - May 2025", "inst" => "Sri Ramachandra Institute of Higher Education and Research, Chennai"),
    Dict("degree" => "Bachelor of Science in Advanced Zoology and Biotechnology", "time" => "Sept 2020 - May 2023", "inst" => "Loyola College, Chennai")
]

const SKILLS = [
    Dict("category" => "Molecular Biology", "icon" => "fa-dna", "count" => "7 skills", "items" => ["PCR- Standard, Gradient and Touch-Down", "DNA isolation from blood and oral wash samples", "Cloning", "Transformation", "Ligation", "ELISA", "Gel Electrophoresis"]),
    Dict("category" => "Microbiology", "icon" => "fa-bacterium", "count" => "3 skills", "items" => ["Pure culture techniques", "Disc Diffusion method", "Microbial identification and screening"]),
    Dict("category" => "Cell Culture", "icon" => "fa-vial", "count" => "4 skills", "items" => ["Cell line maintenance", "Cell viability", "Cytotoxicity assay", "Cell migration- Wound Healing assay"]),
    Dict("category" => "Computational Biology", "icon" => "fa-laptop-code", "count" => "4 skills", "items" => [
        "Homology Modelling: SWISS-MODEL",
        "Structural Analysis: Swiss-PdbViewer",
        "Molecular Docking: AMDOCK",
        "Molecular Visualization: PyMOL and Discovery Studio Visualizer"
    ]),
    Dict("category" => "Data Science", "icon" => "fa-database", "count" => "5 skills", "items" => [
        "Language: Julia",
        "Libraries/Packages: DataFrames.jl, CSV.jl, Plots.jl, MLJ.jl and StatsPlot.jl",
        "Model: XGBoost, Random Forest Cross-validation (LOOCV & k-fold) and Feature importance",
        "Techniques: Data Wrangling & Encoding, Exploratory Data Analysis, Model Evaluation and Validation",
        "Tools: Git, Github and VSCode"
    ]),
    Dict("category" => "Others", "icon" => "fa-pen", "count" => "2 skills", "items" => [
        "Scientific Writing",
        "MS Office Packages"
    ])
]

const PROJECTS = [
    Dict(
        "id" => "proj1",
        "icon" => "fa-dna",
        "title" => "Analysis of the SNP, rs7176005 of CYP19A1 in Breast Cancer Pathogenesis using Computational and Molecular Approaches",
        "subtitle" => "PCR & Computational Analysis",
        "summary" => "Computational and molecular analysis of SNP rs7176005 in CYP19A1 for its role in breast cancer pathogenesis.",
        "points" => [
            "Analyzed SNP rs7176005 in CYP19A1 for its role in breast cancer using computational methods.",
            "Led and Collaborated with labmates to design and validate the PCR primers for SNP detection and confirmed via agarose gel electrophoresis.",
            "Investigated estrogen roles, identifying SNP rs7176005 as a potential therapeutic target."
        ]
    ),
    Dict(
        "id" => "proj2",
        "icon" => "fa-bacterium",
        "title" => "cylM Gene Incidence and Molecular Docking of Swietenia macrophylla Compounds against Cytolysin in E. faecalis Dental Isolates",
        "subtitle" => "Gene Screening & Molecular Docking",
        "summary" => "Molecular docking of Swietenia macrophylla compounds against Cytolysin in dental isolates.",
        "points" => [
            "Screened 35 E. faecalis isolates from dental infections using PCR, identifying the incidence of cylM gene.",
            "Performed homology modeling of the cylM protein using SWISS-MODEL and molecular docking with 15 plant compounds via AMDOCK in order to evaluate the binding affinities and interactions.",
            "Evaluated the binding affinities of 15 plant compounds and identified bioactive compounds against cylM protein."
        ]
    )
]

const MANUSCRIPTS = [
    Dict(
        "id" => "manu1",
        "title" => "Virulence Gene Prevalence in Enterococcus faecalis from Dental Infections in South India",
        "type" => "Manuscript in Communication",
        "points" => [
            "Co-authored a study on virulence genes in Enterococcus faecalis and analyzed eight virulence genes in 36 E. faecalis isolates from South Indian dental infections.",
            "Highlighted the clinical implications of virulence gene distribution, providing key insights into infection mechanisms.",
            "Contributed to drafting and revising a manuscript on E. faecalis pathogenicity in oral infections."
        ]
    ),
    Dict(
        "id" => "manu2",
        "title" => "juProt: A Web Application for Comparative Analysis of Protein-Ligand Interactomes",
        "type" => "Manuscript in Communication",
        "link" => "https://juprot.info",
        "points" => [
            "Assisted in the development of juProt, an open-source web application built in Julia (Genie.jl) that automates the comparative analysis of the complete protein-ligand interactions such as Hydrogen bonds, Hydrophobic contacts, Salt Bridges, &pi;-Stacking, etc.",
            "Conducted rigorous validation against standalone PLIP using 20 diverse experimental and docked complexes, achieving 100% concordance across all interaction types.",
            "Applied juProt to study Human Aromatase inhibitors (Letrozole/Anastrozole) which will be helpful in studying and understanding how mutation impact interaction patterns and affect drug binding affinity.",
            "Key features include automated PDB retrieval, interaction fold-change calculation and generation of 2D Spatial Pocket Projection.",
            "Live tool: <a href='https://juprot.info' target='_blank' class='text-teal-600 hover:underline font-bold'>juprot.info</a>"
        ]
    ),
    Dict(
        "id" => "manu3",
        "title" => "Machine Learning-Based Prediction of Diabetic Retinopathy and Nephropathy (Hornerin & SFN Biomarkers)",
        "type" => "Manuscript in Communication",
        "points" => [
            "Utilized a Random Forest Classifier in Julia to predict the progression from Diabetes Mellitus (DM) to Diabetic Retinopathy (DR) or Nephropathy (DN).",
            "Statistically validated the efficacy of novel biomarkers, Hornerin and SFN across disease groups, contributing to their recognition for early diabetic complication detection.",
            "Analyzed 33 clinical and demographic features to identify the strongest predictors of complication onset to aid in improved patient care strategies."
        ]
    ),
    Dict(
        "id" => "manu4",
        "title" => "Predicting Chronic Hepatitis B Progression Using Interpretable Machine Learning on Sparse Clinical Data",
        "type" => "Manuscript in Communication",
        "points" => [
            "Utilized interpretable machine learning (XGBoost in Julia) to predict the progression from acute to chronic Hepatitis B infection, achieving a 90.9% accuracy rate.",
            "Identified and ranked the most critical biomarkers as the strongest predictors of chronicity and offering key insights for early risk stratification.",
            "Engineered and analyzed 34 clinical and serological features from real-world data to build a robust model, contributing to the development of improved strategies for managing high-risk Hepatitis B patients."
        ]
    )
]

const CERTS = [
    Dict(
        "id" => "c1",
        "icon" => "fa-laptop-code",
        "title" => "Green Tea Bioactives as Natural DHT Blocker",
        "subtitle" => "E-poster presentation on sustainable therapeutics",
        "points" => [
            "Presented an e-poster on green tea bioactives as DHT blockers, showcasing expertise in computational biology.",
            "Effectively communicated complex scientific concepts in a clear and engaging manner."
        ]
    ),
    Dict(
        "id" => "c2",
        "icon" => "fa-leaf",
        "title" => "Seminar & Workshop on Biodiversity to Biotechnology",
        "subtitle" => "Two-day seminar",
        "points" => [
            "Participated in a two-day seminar on “Biodiversity to Biotechnology,” gaining insights into biodiversity’s role in biofuels, pharmaceuticals, and climate solutions.",
            "Engaged with traditional and modern biotechnological approaches, aligning with global and Indian biodiversity initiatives."
        ]
    ),
    Dict(
        "id" => "c3",
        "icon" => "fa-graduation-cap",
        "title" => "SWAYAM NPTEL- Basics of Crop Breeding and Plant Biotechnology",
        "subtitle" => "12-week IIT Kharagpur course",
        "points" => [
            "Completed a 12-week IIT Kharagpur course on crop breeding, learning the principles of molecular markers, genetic engineering, and transgenic plant screening.",
            "Gained knowledge in applying biotechnological techniques for sustainable agriculture and crop improvement."
        ]
    ),
    Dict(
        "id" => "c4",
        "icon" => "fa-robot",
        "title" => "Generative AI MasterMind – Outskill",
        "subtitle" => "Certification in Prompt Engineering & AI Applications",
        "points" => [
            "Successfully completed the Generative AI MasterMind certification, gaining hands-on experience with prompt engineering and practical AI applications.",
            "Enhanced proficiency in content generation, automation and data-driven problem-solving."
        ]
    )
]