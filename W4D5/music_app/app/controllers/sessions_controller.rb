class SessionsController < ApplicationController

    def create
        email = params[:user][:email]
        password = params[:user][:password]
        @user = User.find_by_credentials(email,password)
        if @user
            log_in_user!(@user)
            redirect_to bands_url
        else
            flash.now[:errors] = "Incorrect login."
            render :new
        end
    end

    def destroy
        log_out_user!
        redirect_to new_sessions_url
    end

    def new
        render :new
    end
end
