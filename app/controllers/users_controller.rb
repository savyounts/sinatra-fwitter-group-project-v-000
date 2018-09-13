class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/users/signup' do

    erb :'/users/create_user'
  end

  post '/users/signup' do
    @user = User.create(params)
    session[:user_id] = @user.id 
    redirect ''
  end

  get '/users/login' do

    erb :'/users/login'
  end

  post '/users/login' do

  end

  get '/users/:id' do

    erb :'/users/show'
  end


end
