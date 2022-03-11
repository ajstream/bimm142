add <- function(x, y=1) {
  x + y
}

add(x=4)


rescale <- function(x) {
  rng <-range(x)
  (x - rng[1]) / (rng[2] - rng[1])
}

rescale(1:10)

rescale( c(1, NA, 4, 10, 20))


rescale01 <- function(x) {
  rng <-range(x, na.rm=TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

rescale01( c(1, NA, 4, 10, 20))



