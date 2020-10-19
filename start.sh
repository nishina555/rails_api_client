#!/bin/bash -eu
rails db:migrate
rm -rf tmp/pids/server.pid
rails server -b '0.0.0.0'