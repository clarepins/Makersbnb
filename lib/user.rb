require 'bcrypt'

class User
  attr_reader :id, :email, :password
  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.add(email:, phone_num:, password:)
    encrypted_password = BCrypt::Password.create(password)
    users = []
    result = DatabaseConnection.new.run_query("INSERT INTO users (id, email, phone_num, password) VALUES(DEFAULT, '#{email}', '#{phone_num}', '#{encrypted_password}') RETURNING id, email, password;")
    users << User.new(id: result[0]["id"], email: result[0]["email"], password: result[0]["password"])
    return users
  end

  def self.find(email:)
    users = []
    DatabaseConnection.new.run_query("SELECT email FROM users WHERE email = '#{email}';").each do |row|
      users << User.new(id: row["id"], email: row["email"], password: row["password"])
    end
    return users
  end

  def self.find_by_id(id:)
    users = []
    DatabaseConnection.new.run_query("SELECT id FROM users WHERE id = '#{id}';").each do |row|
      users << User.new(id: row["id"], email: row["email"], password: row["password"])
    end
    return users
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.new.run_query("SELECT id, email, password FROM users WHERE email = '#{email}' ;")
    return unless result.any?
    users = []
    result.each do |row|
      if BCrypt::Password.new(row['password']) == password
        users << User.new(id: row["id"], email: row["email"], password: row["password"])
      end
    end
    return users
  end
end
