FROM python:latest

WORKDIR /app

COPY . /app

# Install prerequisites
#RUN apt-get update && apt-get install -y \
#curl

RUN apt-get update && apt-get install curl -y && apt-get install jq -y 


CMD /bin/bash
