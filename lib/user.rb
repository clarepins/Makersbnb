class User
  attr_reader :id, :email, :password
  def initialize(id:, email:, password:)
    @id
    @email = email
    @password = password
  end

  def self.add(email:, phone_num:, password:)
    DatabaseConnection.new.run_query("INSERT INTO users (id, email, phone_num, password) VALUES(DEFAULT, '#{email}', '#{phone_num}', '#{password}');")
  end

  def self.find(email:)
    users = []
    DatabaseConnection.new.run_query("SELECT email FROM users WHERE email = '#{email}';").each do |row|
      users << User.new(id: row["id"], email: row["email"], password: row["password"])
    end
    return users
  end

  def self.authenticate(email:, password:)  
    result = DatabaseConnection.new.run_query("SELECT email, password FROM users WHERE email = '#{email}' AND password = '#{password}';")
    return unless result.any?
    users = []
    result.each do |row|
      users << User.new(id: row["id"], email: row["email"], password: row["password"])
    end
    return users
  end
end
