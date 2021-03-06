class UsersController < ApplicationController
    
    def home
    end
    
    def new 
        @user = User.new
    end
    
    def create 
        @user = User.new(user_params)
        if params[:user][:name] && !params[:user][:name].empty? && @user.save 
            session[:user_id] = @user.id 
            redirect_to home_path 
        else
            redirect_to signup_path 
        end
    end
    
    private 
    
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
        
end