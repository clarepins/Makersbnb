require 'bcrypt'
describe User do

  before(:each) do
    clean_test_database
    User.add(email: "mark@yahoo.com",
      phone_num: "1234",
      password: "abcd")
  end

  it "find user details" do
    user = User.find(email: "mark@yahoo.com")
    expect(user.first.email).to eq("mark@yahoo.com")
  end

  it 'authenticates when a valid email and password is given' do
    authenticated_user = User.authenticate(email: "mark@yahoo.com", password: "abcd")
    expect(authenticated_user.first.email).to eq("mark@yahoo.com")
    unencrypted_password = BCrypt::Password.new(authenticated_user.first.password)
    expect(unencrypted_password).to eq("abcd")
  end

  it 'returns nil when email is not recognised' do
    expect(User.authenticate(email: "mark@wrongEmail.com", password: "n-a")).to be_nil
  end

  # it 'returns '

end
