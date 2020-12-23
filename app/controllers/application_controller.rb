class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end 

    def logged_in?
    end

    def redirect_if_not_logged_in
    end 
end
