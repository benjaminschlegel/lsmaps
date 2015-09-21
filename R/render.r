#' Render a standalone polmeth page
#'
#' Takes the head and body content of a polmeth page and renders
#' the full standalone page either to the console or to a file.
#' Also automagically adds class="active" for navbar elements.
#'
#' @param head_content tagList of content for the <head> of the page
#' @param body_content tagList of content for the <body> of the page
#' @param file passed directly to cat, for usage see \code{\link{cat}}
#' @param make_active name of the navbar element to mark as active, 
#' none if the empty string
#' @return invisibly returns NULL
#' @export
#' @examples
#' # view generated html code
#' lsmapps_render(tags$h1("This is a testpage"),
#'                tags$title("Testpage"))
#' lsmapps_render(tags$h1("This is a testpage"),
#'                tags$title("Testpage"),
#'                make_active="About")
#'
#' \dontrun{lsmapps_render(tags$h1("This is a testpage"),
#'                tags$title("Testpage"),
#'                file="testpage.html")}
lsmapps_render <- function(body_content, head_content=NULL, file="", make_active="") {
  if (is.null(head_content)) {
    html_head <- tags$head(lsmapps_head())
  } else {
    html_head <- tags$head(lsmapps_head(), head_content)
  }
  page_html <- tags$html(html_head,
                         tags$body(lsmapps_navbar(),
                                   body_content)
  )
  doctype <- "<!DOCTYPE html>"
  page_full <- paste(doctype, as.character(page_html), sep="\n")
  # conditionally mark navbar element active
  if (make_active != "") {
    page_full <- add_active(html=page_full, title=make_active)
  }
  doctype <- "<!DOCTYPE html>"
  cat(page_full, file=file)
  invisible(page_full)
}
#' HTML <head> for standalone polmeth pages
#'
#' Creates HTML code, which sets up the <head> section for a standalone polmeth page.
#' \emph{Standalone} means \emph{not a Shiny app} here.
#'
#' @param bootstrap include bootstrap?
#' @param ... further HTML tags for the <head> section
#' @return a tag object that shiny understands
#' @export
#' @examples
#' # view generated html code
#' cat(as.character(lsmapps_head()))
lsmapps_head <- function(bootstrap=TRUE, ...) {
  content <- HTML('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">')
  if (bootstrap) {
    content <- list(content,
      tags$script(src="/shared/jquery.js", type="text/javascript"),
      tags$script(src="/shared/jquery.js", type="text/javascript"),
      tags$link(rel="stylesheet", type="text/css", 
                href="/shared/bootstrap/css/bootstrap.min.css"),
      tags$meta(name="viewport", content="width=device-width, initial-scale=1.0"),
      tags$link(rel="stylesheet", type="text/css",
               href="/shared/bootstrap/css/bootstrap-responsive.min.css"),
      tags$script(src="/shared/bootstrap/js/bootstrap.min.js")
                 )
  }
  tagList(content, ...)
}
