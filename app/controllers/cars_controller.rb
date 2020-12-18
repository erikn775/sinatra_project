class CarsController < ApplicationController

  get '/cars' do
    @cars = Car.all
    erb :'/cars/index'
  end

  get '/cars/new' do
    if logged_in?
      erb :'/cars/new'
    else
      erb:'error'
    end
  end

  post '/cars' do
    car = Car.new(params[:cars])
    if logged_in? && current_user.id == car.user_id 
      if car.save
        redirect '/account'
      else
        @error = car.errors.full_messages.join(" - ")
        erb :'/cars/new'
      end
    else
      erb:'error'
    end
  end

  get '/cars/:id' do 
    @car = Car.find(params[:id])
    erb :'/cars/show'
  end

  get '/cars/:id/edit' do
    @car_edit = Car.find(params[:id])
    if logged_in? && current_user.id == @car_edit.user_id
      erb:'/cars/edit'
    else
      erb:'/cars/error'
    end
    
  end

  patch '/cars/:id' do
    @car_edit = Car.find(params[:id])
    if logged_in? && current_user.id == @car_edit.user_id
        @car_edit.update(params[:cars])
        redirect '/account'
    else
      erb:'/cars/error'
    end
  end

  delete '/cars/:id' do
    car = Car.find(params[:id])
    if logged_in? && current_user.id == car.user_id
      car.destroy
      redirect '/account'
    else
      erb:'/cars/error'
    end
  end
end
