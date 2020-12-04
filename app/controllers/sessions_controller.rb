class SessionsController < ApplicationController

  get '/login' do
    erb :'/sessions/login'
  end

  post '/login' do
    @user = User.find_by_username([:user][:username])
    if @user != nil && user.authenticate(session[:id])
      session[:user_id] = @user.id
      erb :'/users/account'
    else
      erb :'sessions/error'
    end
  end  
end  
