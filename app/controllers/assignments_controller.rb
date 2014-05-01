class AssignmentsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@assignment = @user.assignments.new
 	end

  	def create
  		@user = User.find(params[:user_id])
	  	course = Course.find_by(crn: params[:assignment][:course_id].downcase)
	    if course && signed_in?
	    	@assignment = @user.assignments.new(user_id:@user.id, course_id:course.id)
	      	if @assignment.save
	      		redirect_to user_path(@current_user)
	      	else
	      		render 'new'
	      	end
	  	else
	      flash.now[:error] = 'Course number not found'
	      render 'new'
	    end
  	end

  	def destroy

  	end

end
