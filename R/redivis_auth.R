#' redivis_auth
#'
#' Authenticate Redivis Session with API Token
#' @param token An API token saved from Redivis
#' @export
#' @examples
#' redivis_auth("yourAPItokenhere")
#'
redivis_auth <- function(token) {
  Sys.setenv(REDIVIS_API_TOKEN = token)
}
