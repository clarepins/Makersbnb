feature "user signup" do
  scenario "user can visit homepage and see listings" do
    visit('/')
    expect(page).to have_content("Listings...")
  end

  scenario "lets user sign up and go back to homepage" do
    visit('/')
    click_button('Sign up')
    fill_in('email_input', :with => 'test@test.com')
    fill_in('phone_num_input', :with => '07777777777')
    fill_in('password_input', :with => 'password')
    click_button('Submit')
    expect(page).to have_content("Listings...")
  end
end
