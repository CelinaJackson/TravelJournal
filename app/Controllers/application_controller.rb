require './config/environment'

class ApplicationController < Sinatra::Base 
    
    configure do 
        set :public_folder, 'public'
        set :views, 'app/Views'
        enable :sessions
        set :session_secret, "secure_password"
    end
    
    get '/' do 
        "It's Working!"
    end 

end 