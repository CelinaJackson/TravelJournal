class UsersController < ApplicationController 

  get '/users' do 
    logged_in?
    @current_user = current_user
    @users = User.all 
    erb :'/users/index'
  end 

  get '/users/:id' do 
    logged_in?
    if User.fin_by_id(params["id"])
      @user = User.find_by_id(params["id"])
      erb :'/users/show'
    else 
      redirect to '/users'
    end 
  end 
end 
