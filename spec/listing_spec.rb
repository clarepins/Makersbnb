require './lib/listings.rb'

describe Listing do
  it "user adds a listing name to database" do
    clean_test_database
    Listing.add(property_name: "this is the name",
      price: 100,
      description: "this is description",
      user_id: 1,
      start_date: "2019-03-24",
      end_date: "2019-04-01"
    )
    @listings = Listing.all
    expect(@listings.first.property_name).to eq("this is the name")
    expect(@listings.first.price).to eq(100)
    expect(@listings.first.description).to eq("this is description")
  end

  it "filter by dates" do
    clean_test_database
    Listing.add(property_name: "this is the name",
      price: 100,
      description: "this is description",
      user_id: 1,
      start_date: "2019-03-24",
      end_date: "2019-04-01"
    )
    listings = Listing.filter(start_date: "2019-05-09", end_date: "2019-05-30")
    wrong_listing = []
    listings.each do |listing|
      unless listing.start_date >= "2019-05-09" && listing.end_date <= "2019-05-30"
        wrong_listing << listing
      end
    end

    expect(wrong_listing).to be_empty
  end

  it "filter by dates" do
    clean_test_database
    Listing.add(property_name: "this is the name",
      price: 100,
      description: "this is description",
      user_id: 1, 
      start_date: "2019-03-24",
      end_date: "2019-04-01"
    )
    c_listings = Listing.filter(start_date: "2019-03-28", end_date: "2019-03-30")
    expect(c_listings[0].property_name).to eq("this is the name")
  end
end
