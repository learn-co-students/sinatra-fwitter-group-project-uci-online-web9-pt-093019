class TweetsController < ApplicationController

    get '/tweets' do
        @tweets = Tweets.all 
        erb :'tweets/index'
    end

    get '/tweets/new' do
        erb :'tweets/new'
    end

    get '/tweets/:id' do
        @tweet = Tweets.find(params[:id])
        erb :'tweets/show_tweets'
    end

    get '/tweets/:id/edit' do
        @tweet = Tweets.find(params[:id])
        erb :'tweets/edit_tweet'
    end

    post '/tweets' do
        "Add new Functionality"
    end

    patch '/tweets/:id' do
        "Add edit functionality"
    end

    delete '/tweets/:id' do
        "Add Delete Functionality"
    end
end
