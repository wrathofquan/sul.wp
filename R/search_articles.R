#' search_articles
#'
#' Search by Keyword Across all Years or in One Specific Year
#' @param query A Keyword to run
#' @param year A Year
#' @param strip_html Removes <HTML> tags
#' @param ... other arguments passed to methods
#' @export
#' @examples
#' \dontrun{
#' search_articles(query = "Brexit", year = "2016", strip_html = FALSE, ...)
#' }


search_articles <- function(query = query,
                            year = NULL,
                            strip_html = FALSE,
                            ...) {
  if (missing(year)) {
    sql <- paste0("SELECT id, publish_date, section, kicker, authors, title, blurb, paragraphs, captions
                  FROM `sul.the_washington_post.articles_all`
                  WHERE REGEXP_CONTAINS (paragraphs, '(?i)", query, "') OR REGEXP_CONTAINS (title, '(?i)", query, "') ")
    tb <- redivis.bigrquery::bq_project_query(sql)
    df <- redivis.bigrquery::bq_table_download(tb)
  } else {
    sql <- paste0("SELECT id, publish_date, section, kicker, authors, title, blurb, paragraphs, captions
                  FROM `sul.the_washington_post.articles_", year, "`
                  WHERE REGEXP_CONTAINS (paragraphs, '(?i)", query, "') OR REGEXP_CONTAINS (title, '(?i)", query, "')")
    tb <- redivis.bigrquery::bq_project_query(sql)
    df <- redivis.bigrquery::bq_table_download(tb)
  }
  if (strip_html == TRUE) {
    purrr::map_df(df, function(i) {
      df <- gsub("<.*?>|\\B,+", "", i, perl = TRUE)
      df <- trimws(df)
    })
  } else {
    return(df)
  }
}


