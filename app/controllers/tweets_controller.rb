class TweetsController < ApplicationController

  get '/tweets' do
    @tweets = Tweet.all
    erb :'/tweets/tweets'
  end

  get '/tweets/new' do

    erb :'/tweets/new'
  end

  post '/tweets' do

    redirect '/tweets/:id'
  end

  get '/tweets/edit' do

    erb :'/tweets/edit'
  end

  patch '/tweets/:id' do

    redirect "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id' do

    erb :'tweets/show'
  end

  delete '/tweets/:id/delete' do

    @tweet.destroy
    redirect '/tweets'
  end

end
