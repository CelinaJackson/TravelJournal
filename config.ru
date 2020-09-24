require './config/environment'
 

use Rack::MethodOverride
# use TripsController
use UsersController
run ApplicationController 