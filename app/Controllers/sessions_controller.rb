class SessionsController < ApplicationController 

    get '/login' do 
        erb :"sessions/login.html"
    end 

    post '/sessions' do 
        session[:email] = params[:email]
        redirect '/trips'
    end 
end 
