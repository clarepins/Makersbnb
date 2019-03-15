require 'date'

feature "listing availability" do
  scenario "owner adds an availability range to a listing" do
    visit('/add_listing')
    fill_in('property_name_input', with: "my house")
    fill_in('price_input', with: 100)
    fill_in('description_input', with: "this is my really nice house")
    fill_in('range_start', with: (Date.today + 10).to_s)
    fill_in('range_end', with: (Date.today + 20).to_s) 
    click_button('Submit')
    expect(page).to have_content("Listings post here...")
    expect(page).to have_content("my house")
    expect(page).to have_content("this is my really nice house")
    expect(page).to have_content("Available from: #{(Date.today + 10).to_s} - #{(Date.today + 20).to_s}")
  end
end
