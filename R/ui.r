#' Navigation bar and dropdown menus for all polmeth pages
#'
#' Creates HTML code which contains the navigation bar and dropdown menus
#' common to all lsmapps pages.
#'
#' @return a tag object that shiny understands
#' @export
#' @examples
#' # view generated html code
#' as.character(lsmapps_navbar())
lsmapps_navbar <- function() {
  HTML('<div class="navbar navbar-static-top">
<div class="navbar-inner">
<div class="container">
<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="brand" href="/">Polmeth Tutorials</a>
<div class="nav-collapse collapse">
<ul class="nav">
  <li><a href="/">Overview</a></li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">Statistics <b class="caret"></b></a>
<ul class="dropdown-menu">
<li><a href="/stat/">Overview</a></li>
<li class="nav-header">Distributions</li>
<li><a href="/stat/bernoullidist">Bernoulli</a></li>
<li><a href="/stat/binomialdist">Binomial</a></li>
<li><a href="/stat/normaldist">Normal</a></li>
<li><a href="/stat/tdist">Student’s t</a></li>
<li><a href="/stat/chi2dist">χ² (Chi^2)</a></li>
<li><a href="/stat/fdist">F</a></li>
<li><a href="/stat/poissondist">Poisson</a></li>
<li><a href="/stat/bivnormdist">Bivariate Normal</a></li>
<li class="nav-header">Concepts</li>
<li><a href="/stat/corr">Correlation</a></li>
<li><a href="/stat/sampdistmean">Sampling distribution</a></li>
<li class="nav-header">Visualization</li>
<li><a href="/stat/dataviscont">Continuous data</a></li>
</ul>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">R Tutorials <b class="caret"></b></a>
<ul class="dropdown-menu">
<li class="nav-header">Screencasts</li>
<li><a href="/R/sc/episode1.html">Episode 1</a></li>
<li><a href="/R/sc/episode2.html">Episode 2</a></li>
<li><a href="/R/sc/episode3.html">Episode 3</a></li>
<li class="nav-header">Sessions</li>
<li><a href="/R/sessionshs2013.html">Fall 2013</a></li>
<li><a href="/R/sessionsfs2014.html">Spring 2014</a></li>
</ul>
</li>
<li><a href="/about.html">About</a></li>
</ul>
</div>
</div>
</div>
')
}
#' Page generator function for lsmapps pages
#'
#' Creates HTML code which contains the navigation bar and dropdown menus
#' common to all lsmapps pages.
#'
#' @param title title of the app
#' @param sidebar_content content in the sidebar, normally input
#' @param main_content content in the main window, normally output
#' @return UI defintion that can be passed to the shinyUI function
#' @export
#' @examples
#' # todo
lsmapps_page <- function(title, sidebar_content, main_content) {
  bootstrapPage(
    tags$head(tags$title(paste(title, "Polmeth Tutorials", sep=" \u00b7 "))),
    lsmapps_navbar(),
    div(class="container-fluid",
        div(class="row-fluid",
            div(class="span12", style="padding: 10px 0px;",
                h1(title)
                )
            ),
        div(class="row-fluid",
            sidebar_content,
            main_content)
        )
  )
}
