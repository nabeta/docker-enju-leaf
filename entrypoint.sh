#!/bin/bash

set -e

if [ "$1" = "bundle" ]; then
	if [ ! -e .env ]; then
		if [ "$SECRET_KEY_BASE" = "" ]; then
			SECRET_KEY_BASE=`bundle exec rake secret`
		fi

		echo "SECRET_KEY_BASE=$SECRET_KEY_BASE" >> .env
		rails g enju_leaf:quick_install
	fi
fi

exec "$@"
