
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sul.wp

<!-- badges: start -->
<!-- badges: end -->

The goal of sul.wp is to help Stanford researchers access the Library’s
collection of Washington Post Full-Text Archives through R

## Installation

``` r
install.packages("devtools")
devtools::install_github("wrathofquan/sul.wp")
```

## Authenticate

``` r
library(sul.wp)

## Authenticate with Redivis/BigQuery 
## Instructions on how to access your token: https://apidocs.redivis.com/authorization

#redivis_auth("your-api-token")
```

# Retrieve Articles by Year

``` r
## Get an entire year of articles

df_1999 <- get_articles_year("1999")

head(df_1999)
#> # A tibble: 6 x 5
#>   publish_date     section authors title             paragraphs                 
#>   <chr>            <chr>   <chr>   <chr>             <chr>                      
#> 1 1999-05-12T00:0… local   <NA>    "Edward Flynn Di… "Edward James Flynn, 84, w…
#> 2 1999-05-15T00:0… local   <NA>    "District Tourna… "Cardinal District, Stonew…
#> 3 1999-07-25T00:0… local   <NA>    "DEATHS ELSEWHER… "Ludwik Gross, Cancer Rese…
#> 4 1999-05-23T00:0… local   <NA>    "IN BRIEF "       "School Officials Talk Saf…
#> 5 1999-05-06T00:0… local   <NA>    "METRO IN BRIEF " "THE REGION, Md. Urges Nit…
#> 6 1999-05-20T00:0… local   <NA>    "Track and Field… "2A South, Who: Atholton, …
```

# Search Corpora by Keyword

``` r
## Search by case-insensitive keyword, restrict by year, remove <html> formatting from articles

df_blm <- search_articles(query = "Black Lives Matter", year = "2020", strip_html = FALSE)

head(df_blm)
#> # A tibble: 6 x 5
#>   publish_date    section      authors title              paragraphs            
#>   <chr>           <chr>        <chr>   <chr>              <chr>                 
#> 1 2020-07-28T10:… /podcasts/c… <NA>    Derek Black was g… "Black grew up in a f…
#> 2 2020-08-27T02:… /local/traf… Luz La… New Yorkers are b… "Hilena Tibebe is ped…
#> 3 2020-07-03T22:… /local/traf… Luz La… Fourth of July in… "Even as local offici…
#> 4 2020-07-16T21:… /lifestyle   Jada Y… How a middle scho… "NEW YORK, — A gold S…
#> 5 2020-07-16T22:… /entertainm… Pat My… Style Invitationa… "(Click <a href=\"#re…
#> 6 2020-06-09T02:… /sports/nhl  Des Bi… Intent on ending … "Seven current and fo…
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
