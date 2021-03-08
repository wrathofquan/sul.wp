#' redivis_auth
#'
#' Authenticate Redivis Session with API Token
#' @export
#' @examples
#' redivis_auth("yourAPItokenhere")
#'
redivis_auth <- function(i) {
  Sys.setenv(REDIVIS_API_TOKEN = i)
}
