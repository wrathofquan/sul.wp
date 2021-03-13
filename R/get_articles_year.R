#' get_articles_year
#'
#' Get a Single Years Worth of Articles
#' @param year A year
#' @export
#' @examples
#' \dontrun{
#' get_articles_year("1977")
#' }

get_articles_year <- function(year) {
  sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_", year, "`")
  tb <- redivis.bigrquery::bq_project_query(sql)
  df <- redivis.bigrquery::bq_table_download(tb)
}


