class CarsController < ApplicationController

  # GET: /cars
  get "/cars" do
    erb :"/cars/index.html"
  end

  # GET: /cars/new
  get "/cars/new" do
    erb :"/cars/new.html"
  end

  # POST: /cars
  post "/cars" do
    redirect "/cars"
  end

  # GET: /cars/5
  get "/cars/:id" do
    erb :"/cars/show.html"
  end

  # GET: /cars/5/edit
  get "/cars/:id/edit" do
    erb :"/cars/edit.html"
  end

  # PATCH: /cars/5
  patch "/cars/:id" do
    redirect "/cars/:id"
  end

  # DELETE: /cars/5/delete
  delete "/cars/:id/delete" do
    redirect "/cars"
  end
end
