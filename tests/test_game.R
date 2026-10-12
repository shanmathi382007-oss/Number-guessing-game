# Run from the project folder:  Rscript tests/test_game.R
source("R/game_functions.R")

stopifnot(check_guess(50, 37) == "Too High!")   # examples from report Section 8
stopifnot(check_guess(20, 37) == "Too Low!")
stopifnot(check_guess(37, 37) == "Correct")

for (i in 1:500) {
  s <- new_secret()
  stopifnot(s >= 1, s <= 100, s == round(s))
}

stopifnot(is_valid_guess(1), is_valid_guess(100), is_valid_guess(50))
stopifnot(!is_valid_guess(0), !is_valid_guess(101), !is_valid_guess(NA), !is_valid_guess(5.5))

cat("All tests passed\n")
