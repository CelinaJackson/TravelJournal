class TripsController < ApplicationController 

    get "/trips" do
      redirect_if_not_logged_in
      @trips = Trip.all
      erb :'trips/index'
    end
  
    get "/trips/new" do
      redirect_if_not_logged_in
      @error_message = params[:error]
      erb :'trips/new'
    end
  
    get "/trips/:id/edit" do
      redirect_if_not_logged_in
      @error_message = params[:error]
      @trip = Trip.find(params[:id])
      erb :'trips/edit'
    end
  
    post "/trips/:id" do
      redirect_if_not_logged_in
      @trip = Trip.find(params[:id])
      unless Trip.valid_params?(params)
        redirect "/trips/#{@trip.id}/edit?error=invalid trip"
      end
      @trip.update(params.select{|k|k=="name" || k=="capacity"})
      redirect "/trips/#{@trip.id}"
    end
  
    get "/trips/:id" do
      redirect_if_not_logged_in
      @trip = Trip.find(params[:id])
      erb :'trips/show'
    end
  
    post "/trips" do
      redirect_if_not_logged_in
  
      unless Trip.valid_params?(params)
        redirect "/trips/new?error=invalid trip"
      end
      Trip.create(params)
      redirect "/trips"
    end
  end
  