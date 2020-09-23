require './config/environment'
 

use Rack::MethodOverride
use Rack::Session::Cookie
use TripsController
use UsersController
run ApplicationController 