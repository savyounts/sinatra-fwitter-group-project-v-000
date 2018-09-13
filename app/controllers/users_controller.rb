class UsersController < ApplicationController

  get '/' do
    erb :index
  end

  get '/signup' do

    erb :'/users/create_user'
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect '/signup'
    end
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
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end





end
