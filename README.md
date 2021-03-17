
<!-- README.md is generated from README.Rmd. Please edit that file -->

![](https://travis-ci.org/wrathofquan/sul.wp.svg?branch=master)

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

### Authenticate

![](assets/redivis-api.gif)

``` r
library(sul.wp)

## Authenticate with Redivis
## More on Redivis tokens: https://apidocs.redivis.com/authorization

# redivis_auth("your-api-token")
```

### Retrieve Articles by Year

``` r
## Get an entire year of articles

df_1977 <- get_articles_year("1977")

head(df_1977)
#> # A tibble: 6 x 5
#>   publish_date     section authors title             paragraphs                 
#>   <chr>            <chr>   <chr>   <chr>             <chr>                      
#> 1 1977-11-21T00:0… local   <NA>    "Kilda Harrell, … "Kilda Malcolm Harrell, 84…
#> 2 1977-06-08T00:0… local   <NA>    "Chilly Weather … "Blustery winds and unreas…
#> 3 1977-11-10T00:0… local   <NA>    "Greening-up a B… "Harry Roberts, Washington…
#> 4 1977-11-11T00:0… local   <NA>    "Edgar Meritt Do… "Edgar Meritt Douglass, 74…
#> 5 1977-02-02T00:0… local   <NA>    "Benjamin Denio,… "Benjamin W. (Ben) Denio, …
#> 6 1977-07-07T00:0… local   <NA>    "Commuters get 6… "The U.S. Supreme Court th…
```

### Search Corpus by Keyword

``` r
## Search by case-insensitive keyword, restrict by year, remove <html> formatting from articles

df_blm <- search_articles(query = "Black Lives Matter", year = "2016", strip_html = FALSE)

head(df_blm)
#> # A tibble: 6 x 5
#>   publish_date    section   authors      title             paragraphs           
#>   <chr>           <chr>     <chr>        <chr>             <chr>                
#> 1 2016-09-05T06:… postever… Jared Berns… Labor Day spillo… " <p channel=\"wp.co…
#> 2 2016-01-18T18:… /politic… Team Fix     The 4th Democrat… "<em>The complete tr…
#> 3 2016-09-15T07:… lifestyle Ken Burns    essay by ken bur… "<div class=\"inline…
#> 4 2016-01-14T19:… local     Robert McCa… City fails to me… "The District failed…
#> 5 2016-02-26T17:… local     Keith L. Al… Veteran incited … "A Marine war vetera…
#> 6 2016-07-26T21:… politics  Tom Hamburg… After DNC leaks,… "President Obama on …
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
