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
     @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/users/login'
    end
  end

  get '/users/:id' do
    @user = User.find(session[:id])
    erb :'/users/show'
  end

  get 'users/logout' do



end
