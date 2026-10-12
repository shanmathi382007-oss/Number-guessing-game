# Optional: run in a container (no local R needed)
#   docker build -t guessing-game .
#   docker run -p 3838:3838 guessing-game   -> open http://localhost:3838
FROM rocker/shiny:4.4
WORKDIR /app
COPY . /app
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp('/app', host='0.0.0.0', port=3838)"]
