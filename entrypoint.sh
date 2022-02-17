#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /opt/webapp/tmp/pids/server.pid

#echo "bundle install..."
# bundle check || bundle install --jobs 4
# set up the database
# rake db:create
# rake db:migrate
# rake db:seed
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"