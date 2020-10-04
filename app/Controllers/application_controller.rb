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
        # @user = User.new(params[:user])
        redirect to '/signup'
      end 
    end 

    get '/signup' do 
     redirect to '/trips' if logged_in?
      @user = User.new
        erb :signup
    end 

    post '/signup' do 
      @user = User.new(params)
      @user.save  
      session[:user_id] = @user.id 
      redirect to '/trips' 
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
        if !current_user 
          redirect to "/login?error=You have to be logged in to do that"
        end
      end
  
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        @user = User.find(session[:user_id]) if session[:user_id]
      end

      # def if_authorized_to_edit 
      #   # if current user is equal to the user who created the post 
      #   # allow them to edit or delete the post 
      #   # if current user is not equal to the user who created the post
      #   # send message "you are not authorized to edit a post you didn't create"
      #   if session[:user_id] == @trip[:user_id] 
      #     @trip.update 
      #   else 
      #     "You are not authorized to edit a post you did not create."
      #   end 
      # end 
    end
  
end 