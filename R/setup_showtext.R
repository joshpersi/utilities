#' @title
#' Configure {showtext} options
#'
#' @description
#' A wrapper around several showtext functions to import Google Noto fonts
#'
#' @return
#' Invisible
#'
#' @examples
#' setup_showtext()
#'
#' @export

setup_showtext <- function() {
  showtext::showtext_auto()

  showtext::showtext_opts(dpi = 300)

  sysfonts::font_add_google("Noto Serif")

  sysfonts::font_add_google("Noto Sans")

  sysfonts::font_add_google("Noto Sans Mono")

  base::invisible()
}
