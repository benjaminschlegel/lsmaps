\name{lsmapps_head}
\alias{lsmapps_head}
\title{HTML <head> for standalone polmeth pages}
\usage{
  lsmapps_head(bootstrap = TRUE, ...)
}
\arguments{
  \item{bootstrap}{include bootstrap?}

  \item{...}{further HTML tags for the <head> section}
}
\value{
  a tag object that shiny understands
}
\description{
  Creates HTML code, which sets up the <head> section for a
  standalone polmeth page. \emph{Standalone} means
  \emph{not a Shiny app} here.
}
\examples{
# view generated html code
cat(as.character(lsmapps_head()))
}

