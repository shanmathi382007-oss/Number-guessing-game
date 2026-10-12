# Game logic for the Number Guessing Game (kept separate so it can be tested)

new_secret <- function(low = 1, high = 100) {
  sample(low:high, 1)
}

# Compare a guess with the secret number
check_guess <- function(guess, secret) {
  if (guess > secret) {
    "Too High!"
  } else if (guess < secret) {
    "Too Low!"
  } else {
    "Correct"
  }
}

# A valid guess is a whole number from 1 to 100
is_valid_guess <- function(guess, low = 1, high = 100) {
  length(guess) == 1 && !is.na(guess) && guess == round(guess) &&
    guess >= low && guess <= high
}
