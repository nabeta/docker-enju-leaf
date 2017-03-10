sql = "SELECT NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_schema NOT IN ('pg_catalog', 'information_schema'));"
conn = ActiveRecord::Base.connection
is_empty = conn.select_value(sql)

#puts is_empty

exit is_empty == 't'
