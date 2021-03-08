#auth_redivis: sets API token

auth_redivis <- function(i) {
  Sys.setenv(REDIVIS_API_TOKEN = i)
}
