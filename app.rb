require 'sinatra/base'
require './lib/listings.rb'
require 'sinatra/flash'
require './lib/db_connection.rb'
require './lib/user.rb'
require './lib/listings.rb'

class Makersbnb < Sinatra::Base

  enable :sessions

  get '/' do
    @user = session[:user_id]
    erb :'index.html'
  end

  get '/add_listing' do
    erb :'add_listing.html'
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

  get '/signup' do
    erb :'signup.html'
  end

  post '/signup' do
    @user = User.add(email: params[:email_input],
      phone_num: params[:phone_num_input],
      password: params[:password_input])
    session[:user_id] = @user.first.id
    redirect '/'
  end

  get '/login' do
    erb :'login.html'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/wrong' do
    erb :'wrong.html'
  end

  post '/login' do
    @user = User.authenticate(email: params[:email_input], password: params[:password_input])

    if @user
      session[:user_id] = @user[0].id
      redirect '/'
    else
      redirect '/wrong'
    end

  end
end
