require 'sinatra/base'
require './lib/listings.rb'
require 'sinatra/flash'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

end
