class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/signup' do

    erb :'/users/create_user'
  end

  post '/signup' do
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{session[:user_id]}"
  end

  get '/login' do

    erb :'/users/login'
  end

  post '/login' do
     @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find(session[:user_id])
    erb :'/users/show'
  end

  get '/logout' do
    @user = User.find(session[:user_id])
    session.clear
    redirect '/login'
  end



end
