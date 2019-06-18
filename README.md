# movie-rating

This project gets the movie rating from Rotten Tomatoes from an external API http://www.omdbapi.com/ by the movie title. The project is dockerized.

# How to run from docker hub
1. Pull the image from dockerhub `docker pull soumyaparambil/movie-ratings:1.0-shell`
2. Run the docker container `docker run -it soumyaparambil/movie-ratings:1.0-shell`
3. Once the docker container is up, run the script `./movie-ratings.sh <movie_name>`

# Building locally and running ( if need to fork and make changes )
1. Create a docker image with the below command `docker build --tag=<docker-image-name> .`
2. Run the docker container `docker run -it <docker-image-name>`
3. Once the docker container is up, run the script `./movie-ratings.sh <movie_name>`


# Test Cases covered
1. Checks for empty string on movie names
2. Checks movie names with more than one words
3. Checks for valid movie names
