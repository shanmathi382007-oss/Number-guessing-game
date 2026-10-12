# Run once to set up the environment:  Rscript install_packages.R
needed  <- c("shiny")
missing <- needed[!needed %in% rownames(installed.packages())]
if (length(missing)) install.packages(missing, repos = "https://cloud.r-project.org")
cat("All packages installed:", paste(needed, collapse = ", "), "\n")
