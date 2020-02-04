require_relative '../../config/environment'

class UsersController < ApplicationController

    get '/signup' do
        if Helpers.is_logged_in?(session)
            redirect to '/tweets'
        else
            erb :'users/create_user'
        end
    end

    post '/signup' do        
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id
            redirect to '/tweets'
        else
            redirect to '/signup'
        end
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect to '/tweets'
        else
            erb :'users/login'
        end
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if params[:username] && user
            if user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect to '/tweets'
            else
                redirect to '/login'
            end
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/login'
    end
    
end
