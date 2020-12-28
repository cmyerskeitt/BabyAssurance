class SessionsController < ApplicationController

    def home
    end 

    def new
    end 

    def create 
        # binding.pry 
        user = User.find_by(username: params[:username])
        # binding.pry 
        if user && user.authenticate(params[:password])
            # binding.pry 
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            # binding.pry
            flash[:message] = "Incorrect Credentials, please try again!"
            redirect_to "/login"
        end
    end 

    def destroy
        session.clear
        redirect_to root_path
    end 
end
