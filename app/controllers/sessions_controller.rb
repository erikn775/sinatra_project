class SessionsController < ApplicationController

  get '/login' do
    erb :'/sessions/login'
  end

  post '/login' do
    user = User.find_by_username(params[:username])
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/account'
    else
      erb :'error'
    end
  end 

  get '/logout' do
    session.clear
    redirect to '/login'
  end

end  
