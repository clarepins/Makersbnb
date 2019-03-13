describe User do
  it "add a user details" do
    User.add(email: "mark@yahoo.com",
      phone_num: "1234",
      password: "abcd")
    user = User.find(email: "mark@yahoo.com")


  expect(user.first.email).to eq("mark@yahoo.com")
end



  # it 'authenticates when a valid email and password is given' do
  #   authenticated_user = User.authenticate(user.email, user.password)
  #   expect(authenticated_user).to eq(user)
  # end

end
