describe User do

  before(:each) do
    User.add(email: "mark@yahoo.com",
      phone_num: "1234",
      password: "abcd")
  end

  it "add a user details" do
    user = User.find(email: "mark@yahoo.com")
    expect(user.first.email).to eq("mark@yahoo.com")
  end

  it 'authenticates when a valid email and password is given' do
    authenticated_user = User.authenticate(email: "mark@yahoo.com", password: "abcd")
    expect(authenticated_user.email).to eq("mark@yahoo.com")
    expect(authenticated_user.password).to eq("abcd")

  end

end
