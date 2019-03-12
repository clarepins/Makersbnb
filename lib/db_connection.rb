require 'pg'

class DatabaseConnection

  def initialize
    ENV['ENVIRONMENT'] == 'test' ? @conn = PG.connect(dbname: 'makersbnb') : @conn = PG.connect(dbname: 'makersbnb')
  end

  def run_query(string)
    return @conn.exec(string)
  end
end
