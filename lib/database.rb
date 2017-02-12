# Database connection
#
# set resource based on environment
database = ENV.fetch('BLOGAPI_DB', "blog.db")

DB = SQLite3::Database.new database
DB.results_as_hash = true

