class UsersController < ApplicationController

  

  get "/signup" do
    erb :'/users/signup'
  end

  post '/signup' do
      user = User.new(params[:user])
      if user.save
        session[:user_id] = user.id
        redirect '/login'
      else
        @error = user.errors.full_messages.join(" - ")
        erb :'users/signup'
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
