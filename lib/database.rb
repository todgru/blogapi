# Database connection
DB = SQLite3::Database.new "blog.db"
DB.results_as_hash = true

