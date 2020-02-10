class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/tweets'
    else
      erb :'/users/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/tweets'
    else
      erb :'/users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  post '/signup' do
    if logged_in?
      redirect '/tweets'
    else
      user = User.new(params)
      if user.username != "" && user.email != "" && user.save
        session[:user_id] = user.id
        redirect '/tweets'
      else
        redirect '/signup'
      end
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/tweets'
    else
      redirect '/login'
    end
  end
end
