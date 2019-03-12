require './lib/listings.rb'

describe Listing do
  it "user adds a listing name to database" do
    clean_test_database
    Listing.add(property_name: "this is the name",
      price: 100,
      description: "this is description",
      owner_name: "name",
      email: "clare@google",
      phone_num: "1234")
    @listings = Listing.all
    expect(@listings.first.property_name).to eq("this is the name")
    expect(@listings.first.price).to eq(100)
    expect(@listings.first.description).to eq("this is description")
    expect(@listings.first.owner_name).to eq("name")
    expect(@listings.first.email).to eq("clare@google")
    expect(@listings.first.phone_num).to eq("1234")
  end
end
