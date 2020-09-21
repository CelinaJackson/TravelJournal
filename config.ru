require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration? 
    raise "Migrations are pending. Run 'rake db:migrate' to resolve issue." 
end 

use Rack::MethodOverride
use TripsController
use UsersController
run ApplicationController 