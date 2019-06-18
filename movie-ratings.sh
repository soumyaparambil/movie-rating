#!/bin/sh

MOVIE_NAME=$1
API_KEY=30a0de 				#### apikey is hardcoded now. This can be generalized based on the requirement.
MOVIE_RATINGS_BY="Rotten Tomatoes"	#### This can generalized based on the requirement later.

if [ -z "$MOVIE_NAME" ]
then 
	echo "No argument supplied. Usage is ./list-movies.sh MOVIE_NAME"
	exit 0
fi

urlencode() {
  python -c 'import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1], sys.argv[2]))' \
    "$1" "$urlencode_safe"
}


ENC_MOVIE_NAME=$(urlencode "$MOVIE_NAME")

JSON_RESULT=$(curl -s "http://www.omdbapi.com/?t=$ENC_MOVIE_NAME&apikey=$API_KEY")

RESPONSE=$(echo $JSON_RESULT | jq -r '.Response')

if [ $RESPONSE != "True" ]
then
	echo "No movie found by the name '$MOVIE_NAME'"
	exit 0
fi


#RATING=$(curl -s "http://www.omdbapi.com/?t=$ENC_MOVIE_NAME&apikey=30a0de" | jq -r '.Ratings' | jq -r '.map(select(.Source=="Rotten Tomatoes")) | .[] .Value')
RATING=$( echo $JSON_RESULT | jq -r '.Ratings' | jq -r 'map(select(.Source=="Rotten Tomatoes")) | .[] .Value')

if [ -z "$RATING" ] 
then
	echo "No Rotten Tomatoes rating exist for the movie '$MOVIE_NAME'"
else 
	echo "Rotten Tomatoes rating for the movie '$MOVIE_NAME' is $RATING"
fi
