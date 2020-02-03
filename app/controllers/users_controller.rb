class UsersController < ApplicationController

    get 'users/signup' do
        erb :'users/create_user'
    end

    post 'users/signup' do
        "Add sign up functionality"
    end

    get 'users/login' do
        erb :'users/login'
    end

    post 'users/login' do
        "Add login functionality"
    end

    get 'users/logout' do
        "Clear Session Hash"
        erb :'/users/logout'
    end
end
