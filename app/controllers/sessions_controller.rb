class SessionsController < ApplicationController

    def home
    end 

    def new
    end 

    def destroy
        session.clear
        redirect_to root_path
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

    def google 
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex
        end
        if @user.save 
            session[:user_id] = @user.id
            # binding.pry 
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end 
        # binding.pry 
    end 

    private 

    def auth
        request.env['omniauth.auth']
    end
   
end
