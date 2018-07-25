class ApplicationController < ActionController::Base
    
    before_action :authenticate_user!
    
    rescue_from ActiveRecord::RecordNotFound,with: :resource_not_found
    
    protected
    def resource_not_found
        
    end
end
