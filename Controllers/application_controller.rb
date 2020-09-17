
class ApplicationController < Sinatra::Base 
    
    configure do 
        set :public_foler, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "traveljournal"
    end
    
    get '/' do 
        "Hello World!"
    end 
end 