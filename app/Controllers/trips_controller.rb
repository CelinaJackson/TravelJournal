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
      @trip = Trip.find(params[:id])
      erb :'/trips/edit'
    end

    get '/trips/show' do 
      @trips = Trip.all
      erb :'/trips/show'
    end 

    get '/trips/:id' do
      redirect_if_not_logged_in
      @trip = Trip.find(params[:id])
        erb :'/trips/show'
    end
  
    post '/trips/:id' do
      redirect_if_not_logged_in
      if !@trip = Trip.find(params[:id])
        redirect "/trips/#{@trip.id}/edit?error=invalid trip"
      end
      @trip.update(params.select{|k|k=="location" || k=="description"})
      redirect "/trips/#{@trip.id}"
    end
  
  
    post '/trips' do
      redirect_if_not_logged_in
      @trip = Trip.new(params)
      unless @trip.save
        redirect '/trips/new?error=invalid trip'
      end 
      redirect '/trips'
    end

  end
