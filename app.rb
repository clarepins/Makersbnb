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



end
