#auth_redivis: sets API token

auth_redivis <- function(i) {
    devtools::install_github("r-dbi/bigrquery")
    Sys.setenv(REDIVIS_API_TOKEN = i)
}
