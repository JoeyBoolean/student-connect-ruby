class SessionsController < ApplicationController
	skip_before_filter :require_login
	def new
 	end

  	def create
	  	@user = User.find_by(email: params[:session][:email].downcase)
	    if @user && @user.authenticate(params[:session][:password]) && @user.validated
	      sign_in @user
	      redirect_to user_path(@user)
	  	else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
  	end

  	def destroy
  		sign_out
    	redirect_to signin_path
  	end
end
