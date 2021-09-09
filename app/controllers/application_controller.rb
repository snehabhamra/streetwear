class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
end
    #if not authenticated or logged in user cannot view shop