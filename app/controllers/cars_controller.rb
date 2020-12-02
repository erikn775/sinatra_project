class CarsController < ApplicationController

  get "/cars" do
    @cars = Car.all
    erb :"/cars/index.html"
  end

  get "/cars/new" do
    erb :"/cars/new.html"
  end

  post "/cars" do
    redirect "/cars"
  end

  get "/cars/:id" do
    erb :"/cars/show.html"
  end

  get "/cars/:id/edit" do
    erb :"/cars/edit.html"
  end

  patch "/cars/:id" do
    redirect "/cars/:id"
  end

  delete "/cars/:id/delete" do
    redirect "/cars"
  end
end
