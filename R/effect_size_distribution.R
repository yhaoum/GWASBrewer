#' Effect-size distribution for a trait
#'
#' Returns the mixture-Normal effect-size distribution (from `mixnorm_to_scale_fam`)
#' for a given trait. These are built from the 13-component mixture with
#' variance multipliers 2^(-7:5), using weights estimated from `ww_est.mat`.
#'
#' @param trait Character string. The trait name.
#'   Use [effect_dist_traits()] to see available names.
#'
#' @return A function (as returned by `mixnorm_to_scale_fam`) representing
#'   the trait-specific effect-size distribution.
#' @export
#'
#' @examples
#' # List available traits
#' effect_dist_traits()
#'
#' # Get BMI distribution
#' f <- effect_dist("Body mass index")
#' # Use `f` as you would with mixnorm_to_scale_fam output
effect_dist <- function(trait) {
  if (!trait %in% names(myf_list)) {
    stop(sprintf("Trait '%s' not found. Try effect_dist_traits() to see available options.", trait))
  }
  myf_list[[trait]]
}

#' List all available trait names
#'
#' Returns the vector of trait names available in [effect_dist()].
#' @return Character vector.
#' @export
#'
#' @examples
#' effect_dist_traits()
effect_dist_traits <- function() {
  names(myf_list)
}
