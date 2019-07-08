#!/bin/bash

cd /var/canvas

CANVAS_LMS_ADMIN_EMAIL=jorgev.bo@gmail.com
CANVAS_LMS_ADMIN_PASSWORD=ifjorgev
CANVAS_LMS_ACCOUNT_NAME=Canvas
CANVAS_LMS_STATS_COLLECTION=3

DISABLE_DATABASE_ENVIRONMENT_CHECK=1

export CANVAS_LMS_ADMIN_EMAIL
export CANVAS_LMS_ADMIN_PASSWORD
export CANVAS_LMS_ACCOUNT_NAME
export CANVAS_LMS_STATS_COLLECTION
export DISABLE_DATABASE_ENVIRONMENT_CHECK

# Regeneración de assets para actualización de DB
RAILS_ENV=production bundle exec rake brand_configs:generate_and_upload_all

# Actualizar DB
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake db:load_notifications
