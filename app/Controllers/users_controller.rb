class UsersController < ApplicationController  
 
  get '/users/:id' do 
    logged_in?
    if User.find_by_id(params["id"])
      @user = User.find_by_id(params["id"])
    else 
      redirect to '/users'
    end 
  end 
end 
