#' search_articles
#'
#' Search by keyword across all years or in specific year
#' @export
#' @examples
#' search_articles(query = "China", year = "1977")


search_articles <- function(query = query, year = NULL){
  if(missing(year)) {
    sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_all` WHERE paragraphs LIKE '%", query,"%'")
    tb <- bq_project_query(sql)
    df <- bq_table_download(tb)
  } else {
      sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_", year, "` WHERE paragraphs LIKE '%", query, "%'")
      tb <- bq_project_query(sql)
      df <- bq_table_download(tb)
  }
}
