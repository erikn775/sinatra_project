class SessionsController < ApplicationController

  get '/login' do
    erb :'/sessions/login'
  end

  post "sessions" do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user != nil && user.authenticate(session[:id])
      session[:user_id] = @user.id
      erb :'/users/account'
    else
      erb :'users/error'
    end
  end  
end  
