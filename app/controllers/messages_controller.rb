class MessagesController < ApplicationController
	before_filter :get_course
	before_filter :get_users

	def get_course
		@course = Course.find(params[:course_id])
	end
	def get_users
		@users = User.all
	end
	def new
		@user = @current_user
		@course = Course.find(params[:course_id])
		@message = @course.messages.new
 	end

  	def create
  		@user = @current_user
  		if signed_in?
  			print @current_user.id
  		else
  			print "Hello"
  		end
	  	@course = Course.find(params[:course_id])
	  	# put @course
	    if signed_in?
	    	@message = @course.messages.new(user_id:@current_user.id, course_id:params[:message][:course_id], message:params[:message][:message])
	      	if @message.save
	      		redirect_to course_messages_path(@course)
	      	else
	      		render 'new'
	      	end
	  	else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
  	end

  	def index
  		@messages = @course.messages.includes(:user).all
  	end

  	
  	def destroy

  	end

end
