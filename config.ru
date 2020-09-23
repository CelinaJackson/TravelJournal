require './config/environment'
 

use Rack::MethodOverride
use TripsController
use UsersController
use SessionsController
run ApplicationController 