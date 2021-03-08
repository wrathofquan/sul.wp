#' redivis_auth
#'
#' Authenticate Using Redivis API
#'
#' @format API Key as a String:
#' \describe{
#'   \item{x}{placeholder}
#'
#' }
redivis_auth <- function(i) {
  Sys.setenv(REDIVIS_API_TOKEN = i)
}
