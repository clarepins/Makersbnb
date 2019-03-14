require 'sinatra/base'
require './lib/listings.rb'
require 'sinatra/flash'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :'index.html'
  end

  get '/add_listing' do
<<<<<<< HEAD
    erb :add_listing
=======
    erb :'add_listing.html'
>>>>>>> master
  end

  post '/save_listing' do
    Listing.add(property_name: params[:property_name_input],
      price: params[:price_input],
<<<<<<< HEAD
      description: params[:description_input])
    redirect '/'
  end
end
=======
      description: params[:description_input],
      owner_name: params[:name_input],
      email: params[:email_input],
      phone_num: params[:phone_number_input])
      redirect '/'
    end

    get '/signup' do
      erb :'signup.html'
    end

    post '/signup' do
      params[:email_input]
      params[:phone_num_input]
      params[:password_input]
      redirect '/'
    end

    get '/login' do
      erb :'login.html'
    end

    post '/login.html' do
      params[:email_input]
      params[:password_input]
      redirect '/'
    end
  end
>>>>>>> master
