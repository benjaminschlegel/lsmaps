#' Generate a nav element
#'
#' Generate a html element suitable for a nav-list.
#'
#' @param title name of the nav element
#' @param href link to the element
#' @param active should the element be shown as active?
#' @return html code with the nav element
#' @export
#' @examples
#' el1 <- nav_elem("About", "/about.html", active=FALSE)
#' el2 <- nav_elem("Index", "/index.html", active=TRUE)
#' 
#' cat(as.character(el1))
#' cat(as.character(el2))
nav_elem <- function(title, href, active=FALSE) {
  html <- paste("<li", ifelse(active, " class=\"active\"", ""), ">",
                "<a href=\"", href, "\">",
                title,
                "</a>",
                "</li>",
                sep="")
  HTML(html)
}
# takes html code that contains navbar code and changes the navbar element with title
# = "title" 
add_active <- function(html, title) {
  html_parsed <- htmlParse(as.character(html))
  # find 
  xpexpr <- paste(
    # select the div with navbar class anywhere in doc
    "//div[@class=\"navbar navbar-static-top\"]",
    # select div child with class "navbar-inner"
    "/div[@class=\"navbar-inner\"]",
    # select div child with class "nav-collapse collapse"
    "/div[@class=\"nav-collapse collapse\"]",
    # selects a children with value equal to "title"
    "//a[.=\"", title, "\"]",
    # selects the parent (should be a <li> element) for which to set class="active"
    "/..",
    sep="")
  #node_tochange <- getNodeSet(html_parsed, xpexpr)
#   filter case where no xpath match is found
#   if (length(node_tochange) == 0) {
#     warning("No navbar element corresponds to title")
#     return(html)
#   }
#   if (length(node_tochange) > 1) stop("found more than one matching element")
  # this call automatically changes the relevant node in the html_parsed XML tree
  xpathSApply(html_parsed, xpexpr, addAttributes, class="active")
  out <- saveXML(html_parsed)
  free(html_parsed)
  return(out)
}
