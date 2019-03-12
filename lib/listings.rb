require 'pg'
require './lib/db_connection.rb'

class Listing
  attr_accessor :id, :name
  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.all
    listings = []
    DatabaseConnection.new.run_query("select * from listings").each do |row|
      listings << Listing.new(id: row["id"], name: row["name"])
    end
    listings
  end
end
