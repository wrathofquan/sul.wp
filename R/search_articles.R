#' search_articles
#'
#' Search by Keyword Across all Years or in One Specific Year
#' @export
#' @examples
#' search_articles(query = "police", year = "1977")


search_articles <- function(query = query, year = NULL, strip_html = FALSE){
  if(missing(year)) {
    sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_all` WHERE REGEXP_CONTAINS (paragraphs, '(?i)", query,"')")
    tb <- redivis.bigrquery::bq_project_query(sql)
    df <- redivis.bigrquery::bq_table_download(tb)
  } else {
    sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_", year, "` WHERE REGEXP_CONTAINS (paragraphs, '(?i)", query,"')")
    tb <- redivis.bigrquery::bq_project_query(sql)
    df <- redivis.bigrquery::bq_table_download(tb)
  }
  if(strip_html == TRUE) {
    purrr::map_df(df, function(i){
      df <- gsub("<.*?>", "", i)
    })
  } else{
    return(df)
  }
}

