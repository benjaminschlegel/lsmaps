\name{nav_elem}
\alias{nav_elem}
\title{Generate a nav element}
\usage{
  nav_elem(title, href, active = FALSE)
}
\arguments{
  \item{title}{name of the nav element}

  \item{href}{link to the element}

  \item{active}{should the element be shown as active?}
}
\value{
  html code with the nav element
}
\description{
  Generate a html element suitable for a nav-list.
}
\examples{
el1 <- nav_elem("About", "/about.html", active=FALSE)
el2 <- nav_elem("Index", "/index.html", active=TRUE)

cat(as.character(el1))
cat(as.character(el2))
}

