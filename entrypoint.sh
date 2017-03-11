#!/bin/bash

set -e

if [ "$1" = "bundle" ]; then
	if [ ! -e .env ]; then
		echo "No .env file found. Start Enju-Leaf init process."

		if [ "$SECRET_KEY_BASE" = "" ]; then
			echo "Generating new secret key..."
			SECRET_KEY_BASE=`bundle exec rake secret`
		fi
		echo "SECRET_KEY_BASE=$SECRET_KEY_BASE" >> .env

		echo "Checking if database is empty..."
		if rails runner is_db_empty.rb; then
			IS_DB_EMPTY=YES
			echo "Database is empty."
		fi

		echo "Running database migration..."
		rake db:migrate

		if [ "$IS_DB_EMPTY" = "YES" ]; then
			echo "Inserting initial data..."
			rake enju_leaf:setup
			rake enju_circulation:setup
			rake enju_subject:setup
			rake db:seed
		fi

		echo "Upgrading database..."
		rake enju_leaf:upgrade

		if [ -z "$ENJU_SKIP_SOLR" ]; then
			echo "Re-indexing..."

			rake sunspot:solr:start
			sleep 5
			rake sunspot:reindex
			rake sunspot:solr:stop
		fi

		echo "Enju-Leaf init process completed; ready for start up."
	fi
fi

exec "$@"
