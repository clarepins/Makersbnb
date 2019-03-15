require 'pg'
require './lib/db_connection.rb'

class Listing
  attr_reader :id, :property_name, :price, :description, :email, :phone_num, :start_date, :end_date
  def initialize(id:, property_name:, price:, description:, email:, phone_num:, start_date:, end_date:)
    @id = id
    @property_name = property_name
    @price = price
    @description = description
    @email = email
    @phone_num = phone_num
    @start_date = start_date
    @end_date = end_date
  end

  def self.all
    listings = []
    DatabaseConnection.new.run_query("select listings.id as id, listings.property_name as property_name, listings.price as price, listings.description as description, users.email as email, users.phone_num as phone_num, listings.start_date as start_date, listings.end_date as end_date from listings left outer join users on listings.user_id = users.id").each do |row|
      listings << Listing.new(id: row["id"], property_name: row["property_name"], price: row["price"].to_i, description: row["description"], email: row["email"], phone_num: row["phone_num"], start_date: row["start_date"], end_date: row["end_date"])
    end
    return listings
  end

  def self.add(property_name:, price:, description:, user_id:, start_date:, end_date:)
    # These two lines mean SQL query treats a single quote as a string character and doesn't cause a bug
    property_name = property_name.gsub("'","")
    description = description.gsub("'","")
    DatabaseConnection.new.run_query("INSERT INTO listings (id, property_name, price, description, user_id, start_date, end_date) VALUES(DEFAULT, '#{property_name}', #{price}, '#{description}', #{user_id}, '#{start_date}', '#{end_date}');")
  end

  def self.filter(start_date:, end_date:)
    filtered_listings = []
    self.all.each do |listing|
      if listing.start_date <= start_date && listing.end_date >= end_date
        filtered_listings << listing
      end
    end
    return filtered_listings
  end
end
