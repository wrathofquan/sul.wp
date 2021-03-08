## argument takes one year (e.g., "1985")
## and returns the entire year of articles

get_articles_year <- function(i) {
    sql <- paste0("SELECT publish_date, section, authors, title, paragraphs FROM `sul.washington_post.articles_", i, "`")
    tb <- redivis.bigrquery::bq_project_query(sql)
    df <- redivis.bigrquery::bq_table_download(tb)
}


