
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Build
Status](https://travis-ci.org/wrathofquan/sul.wp.svg?branch=master)](https://travis-ci.org/wrathofquan/sul.wp)

# sul.wp

<!-- badges: start -->
<!-- badges: end -->

The goal of sul.wp is to help Stanford researchers access the Library’s
collection of Washington Post Full-Text Archives through R

### Installation

``` r
install.packages("devtools")
devtools::install_github("wrathofquan/sul.wp")
```

### Authenticate

First log in to redivis.com with your SUNet ID. Then create your API
token:

![](inst/redivis-api.gif)

``` r
library(sul.wp)

## Authenticate with Redivis
## More on Redivis API: https://apidocs.redivis.com/authorization

# redivis_auth("your-api-token")
```

### Retrieve Articles by Single Year

``` r
## Get an entire year of articles

df_1977 <- get_articles_year("1977")

head(df_1977)
#> # A tibble: 6 x 8
#>   publish_date  section kicker authors title   blurb paragraphs    article_url  
#>   <chr>         <chr>   <chr>  <chr>   <chr>   <chr> <chr>         <chr>        
#> 1 1977-11-21T0… local   NA     <NA>    "Kilda… NA    "Kilda Malco… /archive/loc…
#> 2 1977-06-08T0… local   NA     <NA>    "Chill… NA    "Blustery wi… /archive/loc…
#> 3 1977-11-10T0… local   NA     <NA>    "Green… NA    "Harry Rober… /archive/loc…
#> 4 1977-11-11T0… local   NA     <NA>    "Edgar… NA    "Edgar Merit… /archive/loc…
#> 5 1977-02-02T0… local   NA     <NA>    "Benja… NA    "Benjamin W.… /archive/loc…
#> 6 1977-07-07T0… local   NA     <NA>    "Commu… NA    "The U.S. Su… /archive/loc…

dim(df_1977)
#> [1] 30390     8
```

### Retrieve Articles by Multiple Years

``` r
## To get multiple years of articles, you can use purrr, apply, or a 'for' loop.
## Example using purrr:

years <- c("1977", "1980")

df_twoYears <- purrr::map_dfr(years, get_articles_year) 

dim(df_twoYears)
#> [1] 67114     8
```

### Search Corpus by Keyword

``` r
## Search title and paragraphs of articles using case-insensitive keyword, restrict by year, remove <html> formatting from articles
## Note that some articles are assets like embedded videos or image slide-shows
## use of strip_html will likely return empty strings for these types of content. 

df_blm <- search_articles(query = "Black Lives Matter", year = "2016", strip_html = TRUE)

head(df_blm)
#> # A tibble: 6 x 8
#>   publish_date  section  kicker  authors  title  blurb  paragraphs  article_url 
#>   <chr>         <chr>    <chr>   <chr>    <chr>  <chr>  <chr>       <chr>       
#> 1 2016-07-08T1… world    World   Rick No… ‘What… Peopl… "LONDON — … /world/what…
#> 2 2016-07-13T2… sports   Sports  Des Bie… NBA s… LeBro… "Wednesday… /sports/nba…
#> 3 2016-08-24T0… opinions PostEv… Sa'iyda… I&#82… I wan… "The autho… /posteveryt…
#> 4 2016-10-13T1… local    Grade … Kristin… Colle… Dougl… "Members o… /news/grade…
#> 5 2016-06-21T1… /nation… Mornin… Sam Tab… Today… Start… "Why Donal… /news/morni…
#> 6 2016-11-23T1… national Nation… Cleve R… Judge… Feder… "The photo… /national/g…
```

<!-- What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so: -->
<!-- ```{r cars} -->
<!-- summary(cars) -->
<!-- ``` -->
<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>. -->
<!-- You can also embed plots, for example: -->
<!-- ```{r pressure, echo = FALSE} -->
<!-- plot(pressure) -->
<!-- ``` -->
<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->
