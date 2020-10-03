class TripsController < ApplicationController 

    get '/trips' do
      redirect_if_not_logged_in
      @trips = Trip.all
      erb :'/trips/index'
    end
  
    get '/trips/new' do
      redirect_if_not_logged_in
      @error_message = params[:error]
      erb :'/trips/new'
    end
  
    get '/trips/:id/edit' do
      redirect_if_not_logged_in
      @error_message = params[:error]
      @trips = Trip.find(params[:id])
      erb :'/trips/edit'
    end

    get '/trips/show' do 
      @trips = Trip.all
      erb :'/trips/show'
    end 

    get '/trips/:id' do
      redirect_if_not_logged_in
      @trips = Trip.find(params[:id])
        redirect '/trips'
    end


    post '/trips' do
      redirect_if_not_logged_in
      @trip = Trip.new(params)
      unless @trip.save
        redirect '/trips/new?error=invalid trip'
      end 
      redirect '/trips'
    end 
  
    post '/trips/:id' do
      redirect_if_not_logged_in
      if !@trips = Trip.find(params[:id])
        redirect "/trips/#{@trips.id}/edit?error=invalid trip"
      end
      @trips.update(params.select{|k|k=="location" || k=="description"})
      redirect "/trips/#{@trips.id}"
    end

    delete '/trips/:id' do
      @trips = Trip.find_by_id(params[:id])
      @trips.destroy
      redirect '/trips'
    end

    patch '/trips/:id' do 
      redirect_if_not_logged_in
      @trips = Trip.find(params[:id])
      @trips.location = params[:location]
      @trips.description = params[:description]
      @trips.save 
      redirect '/trips'
    end 


  end
