\name{lsmapps_page}
\alias{lsmapps_page}
\title{Page generator function for lsmapps pages}
\usage{
  lsmapps_page(title, sidebar_content, main_content)
}
\arguments{
  \item{title}{title of the app}

  \item{sidebar_content}{content in the sidebar, normally
  input}

  \item{main_content}{content in the main window, normally
  output}
}
\value{
  UI defintion that can be passed to the shinyUI function
}
\description{
  Creates HTML code which contains the navigation bar and
  dropdown menus common to all lsmapps pages.
}
\examples{
# todo
}

