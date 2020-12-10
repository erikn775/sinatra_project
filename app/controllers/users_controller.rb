class UsersController < ApplicationController

  get "/signup" do
    erb :'/users/signup'
  end

  post '/signup' do
      user = User.new(params[:user])
      if user.save
        session[:user_id] = user.id
        redirect '/account'
      else
        erb :'error'
      end
  end

  get '/account' do
    @user = User.find(session[:user_id])
    @user_car = Car.where(user_id: current_user)
    
    erb :'/users/account'
  end
  
end
