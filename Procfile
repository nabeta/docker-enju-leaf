redis: redis-server
solr: bundle exec rake sunspot:solr:run
resque: bundle exec rake environment resque:work QUEUE=enju_leaf,mailers TERM_CHILD=1
cron: cron -f
web: bundle exec rails s -b 0.0.0.0
