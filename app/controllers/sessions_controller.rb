class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        # debugger
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Log in successfull"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Log in failed"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'Log out successfull'
        redirect_to root_path
    end

end