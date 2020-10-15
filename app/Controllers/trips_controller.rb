class TripsController < ApplicationController 

    get '/trips' do
      redirect_if_not_logged_in
      @trips = current_user.trips
      erb :'/trips/index'
    end
  
    get '/trips/new' do
      redirect_if_not_logged_in
      @error_message = params[:error]  
      @trips = Trip.new(params)
      erb :'/trips/new'
    end

    get '/trips/all' do 
      @trips = Trip.all
      erb :'/trips/tripsall'
     end 

    get '/trips/:id' do
      redirect_if_not_logged_in
      @trips = Trip.find(params[:id])
        redirect '/trips'
    end
  
    get '/trips/:id/edit' do
      redirect_if_not_logged_in
      @trips = Trip.find(params[:id])
      if logged_in? && @trips.user == current_user 
        erb :'/trips/edit' 
      else 

        redirect '/trips'
      end 
    end


    post '/trips' do
      redirect_if_not_logged_in
      @trips = current_user.trips.build(params)
      if @trips.save
        redirect '/trips'
      end 
      redirect '/trips/new'
    end 
 

    delete '/trips/:id' do
      @trips = Trip.find(params[:id])
      if @trips.user == current_user
      @trips.destroy
      end 
      redirect '/trips'
    end

    patch '/trips/:id' do 
      redirect_if_not_logged_in
      @trips = Trip.find(params[:id])
      if @trips.user == current_user
      @trips.location = params[:location]
      @trips.description = params[:description]
      @trips.save 
      redirect '/trips'
      else 
        redirect '/trips'
      end
    end 

    # post '/trips/:id' do
    #   redirect_if_not_logged_in
    #   @trips = Trip.find(params[:id])
    #   if @trips.user == current_user
    #   if !@trips = Trip.find(params[:id])
    #     redirect "/trips/#{@trips.id}/edit?error=invalid trip"
    #   end
    #   @trips.update(params.select{|k|k=="location" || k=="description"})
    #   redirect "/trips/#{@trips.id}"
    # end

  end
