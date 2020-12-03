class UsersController < ApplicationController

  

  get "/signup" do
    erb :'/users/signup'
  end

  post '/signup' do
    # if params[:user].values.any?{|value| value.blank?}
    #   redirect '/error'
    # else
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect '/sessions/login'
    #end
  end

  get '/sessions/login' do
    erb :'/users/login'
  end

  post "sessions" do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user != nil && user.authenticate(session[:id])
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :'users/error'
    end
  end

  get '/account' do
    @user = User.find(session[:user.id])
    erb :'/user/account'
  end

  get '/users/:id/edit' do
    erb :"/users/edit.html"
  end

  patch '/users/:id' do
    redirect '/users/:id'
  end

  get 'error' do
    erb :error
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  delete '/users/:id/delete' do
    user = User.find_by(params[:id])
    user.destroy
    redirect '/users'
  end

  
end
