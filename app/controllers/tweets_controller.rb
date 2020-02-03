class TweetsController < ApplicationController

    get '/tweets' do
        if logged_in?
            @tweets = Tweet.where("id = ?", current_user.id)
            if @tweets.empty?
                erb :'tweets/no_tweets'
            else
                erb :'tweets/tweets'
            end
        else
            redirect to '/login'
        end
    end

    get '/tweets/new' do
        erb :'tweets/new'
    end

    get '/tweets/:id' do
        @tweet = Tweet.find(params[:id])
        erb :'tweets/show_tweets'
    end

    get '/tweets/:id/edit' do
        @tweet = Tweet.find(params[:id])
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
