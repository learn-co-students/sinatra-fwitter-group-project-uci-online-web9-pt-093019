class UsersController < ApplicationController


  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    user = User.new(params)
    if user.save && !!params[:username]
      session[:user_id] = user.id
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

end
