#!/bin/bash

set -e

export RAILS_ENV=production
export SECRET_KEY_BASE=`bundle exec rake secret`
export RAILS_SERVE_STATIC_FILES=true

rails g enju_leaf:quick_install

bundle exec foreman start
