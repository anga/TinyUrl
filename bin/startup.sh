#!/bin/sh

echo "Installing new gems..."
bundle install

echo "Runing new migrations..."
rails db:migrate

echo "Starting sergver..."
rails s -b 0.0.0.0
