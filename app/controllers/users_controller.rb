class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/users/create_user' do 

    erb :'/users/create_user'
  end 

  post '/users/create_users' do 

  end 

  get '/users/login' do 

    erb :'/users/login'
  end 

  post '/users/login' do 

  end 

  get '/users/:id'

    erb :'/users/show'
  end 

  
end
