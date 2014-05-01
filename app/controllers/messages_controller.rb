class MessagesController < ApplicationController
	before_action :get_course, only: [:new, :create, :index]
	before_action :get_users, only: [:new, :create, :index]
	before_action :set_message, only: :destroy

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

 	def full_name(first_name, last_name)
 		@full_name = first_name + " " + last_name
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
	      flash.now[:error] = 'Not signed in.'
	      render 'new'
	    end
  	end

  	def index
  		# @user_form = @current_user
		@course_form = Course.find(params[:course_id])
		@message = @course.messages.new
  		@messages = @course.messages.includes(:user).order('created_at DESC').all

  	end

  	
  	def destroy
  		@message.destroy
  		redirect_to course_messages_path(@message.course)
  		#redirect_to courses_path
  	end
  	
  	private

  	def set_message
  		@message = Message.find(params[:id])
  		puts @message.course.id
  		# @course = Course.find(:course_id)
  	end
end
