require 'pg'
require './lib/db_connection.rb'

class Listing
  attr_accessor :id, :property_name, :price, :description, :owner_name, :email, :phone_num
  def initialize(id:, property_name:, price:, description:, owner_name:, email:, phone_num:)
    @id = id
    @property_name = property_name
    @price = price
    @description = description
    @owner_name = owner_name
    @email = email
    @phone_num = phone_num
  end

  def self.all
    listings = []
    DatabaseConnection.new.run_query("select * from listings").each do |row|
      listings << Listing.new(id: row["id"], property_name: row["property_name"], price: row["price"].to_i, description: row["description"], owner_name: row["owner_name"], email: row["email"], phone_num: row["phone_num"])
    end
    p listings
    return listings
  end

  def self.add(property_name:, price:, description:, owner_name:, email:, phone_num:)
    DatabaseConnection.new.run_query("INSERT INTO listings (id, property_name, price, description, owner_name, email, phone_num)
      VALUES(DEFAULT, '#{property_name}', #{price}, '#{description}', '#{owner_name}', '#{email}', '#{phone_num}');")
  end
end
