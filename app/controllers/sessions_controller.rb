class SessionsController < ApplicationController
    def create
        user = User.find_by_name(user_params[:name])
        if user && user.authenticate(user_params[:password])
            session[:user_id] = user.id 
        else
            redirect_to '/users/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:password,:name)
    end
end
