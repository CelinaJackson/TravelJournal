
class ApplicationController < Sinatra::Base 
    
    configure do 
        set :public_folder, 'public'
        set :views, 'app/Views'
        enable :sessions
        set :session_secret
    end
    
    get '/' do 
        erb :index
    end 

end 