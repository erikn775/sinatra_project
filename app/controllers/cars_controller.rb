class CarsController < ApplicationController

  get "/cars" do
    @cars = Car.all
    erb :"/cars/index.html"
  end

  get "/cars/new" do
    erb :"/cars/new.html"
  end

  post "/cars" do
    cars = Car.create(params[:cars])
    redirect "/account"
  end

  get "/cars/:id" do
    @car = Car.find(params[:id])
    erb :"/cars/show.html"
  end

  get "/cars/:id/edit" do
    @car = Car.find(params[:id])
    erb :"/cars/edit.html"
  end

  patch "/cars/:id" do
    car = Car.find(params[:id])
    car.update(params[:cars])
    redirect "/cars/#{car.id}"
  end

  delete "/cars/:id" do
    car = Car.find(params[:id])
    car.destroy
    redirect "/cars"
  end
end
