# Paper Data Format Guide
# This file documents the structure and valid values for papers.yml
# 
# USAGE: Copy the template below to add a new paper to your research page
# LOCATION: Save this file as _data/papers.yml in your Jekyll site

# ==============================================================================
# FIELD DOCUMENTATION
# ==============================================================================
#
# title: (required, string)
#   - The full title of the paper
#   - Use quotes if title contains colons or special characters
#   - Example: "The Economics of Orbit Use: Open Access and External Costs"
#
# authors: (required, string) 
#   - List all authors separated by commas
#   - Put your name in bold with **Name** if desired (Markdown formatting works)
#   - Example: "Akhil Rao, Giacomo Rondina"
#
# venue: (required, string)
#   - Journal name, conference, or "Working Paper" for unpublished
#   - Use full journal names, not abbreviations
#   - Example: "Journal of Environmental Economics and Management"
#
# year: (required, integer)
#   - Publication year or year of working paper
#   - Just the number, no quotes
#   - Example: 2024
#
# summary: (required, string)
#   - 1-2 sentence plain language description
#   - Focus on main finding or contribution, not methodology
#   - Avoid jargon when possible
#   - Example: "Shows that fires depress employment growth for three years."
#
# final_version: (optional, string)
#   - Link to official published version (journal/conference)
#   - Leave empty ("") if no published version available
#   - Example: "https://www.journals.uchicago.edu/doi/10.1086/730695"
#
# preprint: (optional, string)
#   - Link to preprint/working version (arXiv/self-hosted/ResearchGate)
#   - Leave empty ("") if no preprint available
#   - Example: "https://arxiv.org/abs/2202.07442"
#
# type: (required, string)
#   - VALID VALUES: "qualitative_theory", "quantitative_theory", "empirical", "methodology"
#   - qualitative_theory: Conceptual models, theory without formal math
#   - quantitative_theory: Mathematical models, theoretical papers with equations
#   - empirical: Data analysis, econometric studies, natural experiments
#   - methodology: New methods, tools, frameworks, software
#
# domain: (required, string)
#   - VALID VALUES: "space", "macroeconomics"
#   - space: Orbital mechanics, satellites, space policy, space economics
#   - macroeconomics: Labor markets, fires, broad economic impacts
#   - NOTE: Add new domains here as research expands into new areas
#
# status: (required, string)
#   - VALID VALUES: "finished", "active", "dormant", "cold_storage"
#   - finished: Published papers, completed work
#   - active: Working papers being actively developed
#   - dormant: Working papers on back burner but could be revived
#   - cold_storage: Abandoned or indefinitely stalled papers

# ==============================================================================
# TEMPLATE FOR NEW PAPERS
# ==============================================================================

# papers:
#   # Copy this template and fill in your paper details:
#   - title: "Your Paper Title Here"
#     authors: "First Author, Second Author, Third Author"
#     venue: "Journal Name or Working Paper"
#     year: 2024
#     summary: "One to two sentences explaining what this paper shows and why it matters."
#     final_version: "https://journal.example.com/your-paper"  # or ""
#     preprint: "https://arxiv.org/abs/your-paper"  # or ""
#     type: "empirical"  # qualitative_theory, quantitative_theory, empirical, methodology
#     domain: "space"  # space, macroeconomics
#     status: "active"  # finished, active, dormant, cold_storage

# ==============================================================================
# AKHIL RAO'S RESEARCH PAPERS
# ==============================================================================

papers:
  - title: "Orbital-use fees could more than quadruple the value of the space industry"
    authors: "Akhil Rao, Matthew G. Burgess, Daniel Kaffine"
    venue: "Proceedings of the National Academy of Sciences"
    year: 2020
    summary: ""
    final_version: "https://doi.org/10.1073/pnas.1921260117"
    preprint: "https://mpra.ub.uni-muenchen.de/112708/"
    type: "quantitative_theory"
    domain: "space"
    status: "finished"

  - title: "The Economics of Orbit Use: Open Access, External Costs, and Runaway Debris Growth"
    authors: "Akhil Rao, Giacomo Rondina"
    venue: "Journal of the Association of Environmental and Resource Economists"
    year: 2025
    summary: ""
    final_version: "https://www.journals.uchicago.edu/doi/10.1086/730695"
    preprint: "https://arxiv.org/abs/2202.07442"
    type: "quantitative_theory"
    domain: "space"
    status: "finished"

  - title: "Oligopoly competition between satellite constellations will reduce economic welfare from orbit use"
    authors: "Julien Guyot, Akhil Rao, Sébastien Rouillon"
    venue: "Proceedings of the National Academy of Sciences"
    year: 2023
    summary: ""
    final_version: "https://doi.org/10.1073/pnas.2221343120"
    preprint: "https://hal.archives-ouvertes.fr/hal-04255554"
    type: "quantitative_theory"
    domain: "space"
    status: "finished"

  - title: "Space exploration and economic growth: New issues and horizons"
    authors: "Luisa Corrado, Maureen Cropper, Akhil Rao"
    venue: "Proceedings of the National Academy of Sciences"
    year: 2023
    summary: ""
    final_version: "https://doi.org/10.1073/pnas.2221341120"
    preprint: ""
    type: "qualitative_theory"
    domain: "space"
    status: "finished"

  - title: "Disease-economy trade-offs under alternative epidemic control strategies"
    authors: "Thomas Ash, Antonio M. Bento, Daniel Kaffine, Akhil Rao, Ana I. Bento"
    venue: "Nature Communications"
    year: 2022
    summary: ""
    final_version: "https://doi.org/10.1038/s41467-022-30642-8"
    preprint: "https://doi.org/10.1101/2021.02.12.21251599"
    type: "quantitative