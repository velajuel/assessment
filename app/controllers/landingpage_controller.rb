class LandingpageController < ApplicationController

	def index
	end


    def login
        @user = User.find_by(name:params[:name]) 
        if  @user.nil? == true || @user.authenticate(params[:password]) == false
            redirect_to root_path
        else
            session[:user_id] = @user.id
            redirect_to user_path(id: @user.id)
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :email, :password)
    end


end
