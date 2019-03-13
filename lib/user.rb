class User
  attr_reader :email
  def initialize(email:)
    @email = email
  end

  def self.add(email:, phone_num:, password:)
      DatabaseConnection.new.run_query("INSERT INTO users (id, email, phone_num, password) VALUES(DEFAULT, '#{email}', '#{phone_num}', '#{password}');")
    end

    def self.find(email:)
      users = []
      DatabaseConnection.new.run_query("SELECT email FROM users WHERE email = '#{email}'").each do |row|
        users << User.new(email: row["email"])
      end
      return users
    end

end
