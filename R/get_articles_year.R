#' get_articles_year
#'
#' Get a Single Years Worth of Articles
#'
#' @format Year:
#' \describe{
#'   \item{x}{placeholder}
#'
#' }
#' @export

get_articles_year <- function(i) {
    sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_", i, "`")
    tb <- redivis.bigrquery::bq_project_query(sql)
    df <- redivis.bigrquery::bq_table_download(tb)
}


