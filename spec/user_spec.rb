describe User do

  before(:each) do
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
    expect(authenticated_user.first.password).to eq("abcd")
  end

  it 'returns nil when email is not recognised' do
    expect(User.authenticate(email: "mark@yahoo.com", password: "wrongPassword")).to be_nil
  end

end
