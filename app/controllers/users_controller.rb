class UsersController < ApplicationController

    get '/signup' do
        erb :'users/create_user'
    end

    post '/signup' do
        user = User.create(params[:user])
        redirect to '/login'
    
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])
        if params[:user][:username] && user
            if user.authenticate(params[:user][:password])
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
        "Clear Session Hash"
        erb :'/users/logout'
    end
end
