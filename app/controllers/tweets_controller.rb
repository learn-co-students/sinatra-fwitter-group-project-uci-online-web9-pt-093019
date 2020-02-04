require_relative '../../config/environment'

class TweetsController < ApplicationController

    get '/tweets' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
            @tweets = Tweet.all
            erb :'tweets/tweets'
        else
            redirect to '/login'
        end
    end

    get '/tweets/new' do
        if Helpers.is_logged_in?(session)
            erb :'tweets/new'
        else
            redirect to '/login'
        end
    end

    get '/tweets/:id' do
        if Helpers.is_logged_in?(session)
            @tweet = Tweet.find(params[:id])
            erb :'tweets/show_tweet'
        else
            redirect to '/login'
        end
    end

    get '/tweets/:id/edit' do
        if Helpers.is_logged_in?(session)
            @tweet = Tweet.find(params[:id])
            erb :'tweets/edit_tweet'
        else
            redirect to '/login'
        end
    end

    post '/tweets' do
        user = User.find(session[:user_id])
        @tweet = Tweet.new(content: params[:content])
        if @tweet.valid?
            @tweet.save
            @tweet.user = user
            @tweet.save
            user.tweets << @tweet
            user.save
            redirect to "/users/#{user.id}"
        else
            redirect to '/tweets/new'
        end
    end

    patch '/tweets/:id' do
        user = User.find(session[:user_id])
        if params[:content] != ""
            @tweet = Tweet.find(params[:id])
            @tweet.content = params[:content]
            @tweet.save
            redirect to "/tweets"
        else
            redirect to "/tweets/#{params[:id]}/edit"
        end
    end

    delete '/tweets/:id' do
        user = User.find(session[:user_id])
        if Helpers.is_logged_in?(session)
            @tweet = Tweet.find(params[:id])
            if user.id == @tweet.user.id
                @tweet.delete
                redirect to "/tweets"
            else
                redirect to "/tweets"
            end
        else
            redirect to "/login"
        end
    end
    
end
