\name{lsmapps_render}
\alias{lsmapps_render}
\title{Render a standalone polmeth page}
\usage{
  lsmapps_render(body_content, head_content = NULL,
    file = "", make_active = "")
}
\arguments{
  \item{head_content}{tagList of content for the <head> of
  the page}

  \item{body_content}{tagList of content for the <body> of
  the page}

  \item{file}{passed directly to cat, for usage see
  \code{\link{cat}}}

  \item{make_active}{name of the navbar element to mark as
  active, none if the empty string}
}
\value{
  invisibly returns NULL
}
\description{
  Takes the head and body content of a polmeth page and
  renders the full standalone page either to the console or
  to a file. Also automagically adds class="active" for
  navbar elements.
}
\examples{
# view generated html code
lsmapps_render(tags$h1("This is a testpage"),
               tags$title("Testpage"))
lsmapps_render(tags$h1("This is a testpage"),
               tags$title("Testpage"),
               make_active="About")

\dontrun{lsmapps_render(tags$h1("This is a testpage"),
               tags$title("Testpage"),
               file="testpage.html")}
}

