class UsersController < ApplicationController

    get '/users/:id' do
       if !logged_in?
        redirect '/trips/show.html'
       end 
    
      @user = User.find(params[:id])
      if !@user.nil? && @user == current_user
       erb :'/users/show.html'
      else
        redirect '/views/trips'
      end 
    end 

    get '/signup.html' do
      if !session[:user_id]
          erb :'/users/signup.html'
      else
        redirect to '/views/trips'
      end 
    end 
    
    post '/signup.html' do 
       if params[:username] == "" || params[:password] == ""
        redirect to '/users/signup.html'
       else
         @user = User.create(:username => params[:username], :password => params[:password])
         session[:user_id] = @user.id
         redirect '/views/trips'
        end 
    end 
    
    get '/login.html' do 
      @error_message = params[:error]
      if !session[:user_id]
        erb :"/sessions/login.html"
      else
        redirect '/views/trips'
      end 
    end 
    
    post '/login.html' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/views/trips"
      else
       redirect to '/users/signup.html'
      end 
    end 
    
    get '/logout' do
      if session[:user_id] != nil
        session.destroy
        redirect to '/sessions/login.html'
      else
        redirect to '/views/layout'
      end 
    end 
end 