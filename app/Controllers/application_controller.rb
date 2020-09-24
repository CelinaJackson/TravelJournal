require './config/environment'

class ApplicationController < Sinatra::Base 
    
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secure_password"
    end
    
    get '/' do 
      if logged_in?
        redirect to '/trips'
      else 
        erb :welcome
      end 
    end 

    get '/login' do 
      if logged_in?
        redirect to '/trips'
      else 
        erb :login
      end 
    end 

    post '/login' do 
      @user = User.find_by(email: params["email"])
      if !!@user && @user.authenticate(params["password"])
        session[:user_id] = @user.id 
        redirect to '/trips'
      else 
        redirect to '/signup'
      end 
    end 

    get '/signup' do 
      if !logged_in?
        erb :signup
      else 
        redirect to '/trips'
      end 
    end 

    post '/signup' do 
      @user = User.new(params)
      if @user.save 
        @session = session 
        @session[:user_id] = @user.id 
        redirect to '/trips'
      elsif params["email"] == "" || params["password"] == ""
        redirect to '/signup'
      elsif User.find_by(email: params["email"])
        redirect to '/signup'
      else 
        redirect to '/signup'
      end 
    end 


    get '/logout' do 
      if logged_in?
        session.clear
        redirect to '/'
      else 
        erb :login
      end 
    end 



    helpers do
      def redirect_if_not_logged_in
        if !logged_in?
          redirect to "/login?error=You have to be logged in to do that"
        end
      end
  
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end
  
    end
  
end 