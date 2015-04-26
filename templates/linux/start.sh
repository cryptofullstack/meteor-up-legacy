#!/bin/bash

APPNAME=<%= appName %>
APP_PATH=/opt/$APPNAME
BUNDLE_PATH=$APP_PATH/current
ENV_FILE=$APP_PATH/config/env.list
PORT=<%= port %>
USE_LOCAL_MONGO=<%= useLocalMongo? "1" : "0" %>

# remove previous version of the app, if exists
docker rm -f $APPNAME

set -e
docker pull meteorhacks/meteord:latest

if [ "$USE_LOCAL_MONGO" == "1" ]; then
  docker run \
  -d \
  --restart=always \
  --publish=$PORT:$PORT \
  --volume=$BUNDLE_PATH:/bundle \
  --env-file=$ENV_FILE \
  --link=mongodb:mongodb \
  --env=MONGO_URL=mongodb://mongodb:27017/app \
  --env=REBULD_NPM_MODULES=1 \
  --name=$APPNAME \
  meteorhacks/meteord
else
  docker run \
  -d \
  --restart=always \
  --publish=$PORT:$PORT \
  --volume=$BUNDLE_PATH:/bundle \
  --env-file=$ENV_FILE \
  --env=REBULD_NPM_MODULES=1 \
  --name=$APPNAME \
  meteorhacks/meteord
fi