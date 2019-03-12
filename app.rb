require 'sinatra/base'
require './lib/listings.rb'
require 'sinatra/flash'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :'index.html'
  end

 get '/add_listing' do
   erb :add_listing
 end

 post '/save_listing' do
   Listing.add(property_name: params[:property_name_input],
   price: params[:price_input],
   description: params[:description_input],
   owner_name: params[:name_input],
   email: params[:email_input],
   phone_num: params[:phone_number_input])
   redirect '/'
 end
end
