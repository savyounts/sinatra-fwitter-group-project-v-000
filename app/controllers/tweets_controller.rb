class TweetsController < ApplicationController

  get '/tweets' do
    @tweets = Tweet.all
    erb :'/tweets/tweets'
  end

  get '/tweets/new' do
    erb :'/tweets/new'
  end

  post '/tweets' do
    @tweet = Tweet.create(content: params[:content])
    redirect "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/edit'
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    @tweet.update(params)

    redirect "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    # use current_user to find user
    erb :'tweets/show'
  end

  delete '/tweets/:id/delete' do
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect '/tweets'
  end

end
