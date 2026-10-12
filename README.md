# Number Guessing Game (R Shiny Mini Project)

The computer picks a secret number from 1 to 100. You guess; the app says
**Too High!**, **Too Low!** or **Correct**, and counts your attempts.
**New Game** starts another round.

## Folder structure
```
number-guessing-game-r/
├── app.R                         # Shiny app (Run App)
├── R/game_functions.R            # Game logic (random number, compare, validate)
├── tests/test_game.R             # Quick tests of the logic
├── install_packages.R            # One-time package installer
├── Dockerfile                    # Optional container setup
└── number-guessing-game-r.Rproj  # Double-click to open in RStudio
```

## Environment setup
1. Install **R** (https://cran.r-project.org) and **RStudio** (https://posit.co/download/rstudio-desktop).
2. Double-click `number-guessing-game-r.Rproj`.
3. In the console: `source("install_packages.R")`  (installs `shiny`).

## Run
Open `app.R` and click **Run App** (or `Rscript -e "shiny::runApp('.')"`).

## Test (optional)
`Rscript tests/test_game.R` -> prints "All tests passed".

## Small improvements over the report code
- Shows "Start guessing!" and "Attempts: 0" from the beginning (the report code leaves them blank until the first click).
- Rejects guesses that are not whole numbers from 1 to 100 (they don't count as attempts).
- After a win, further guesses are blocked until New Game is clicked, so the attempt count stays correct.
- The win message shows the number of attempts, as described in Section 5 of the report.
