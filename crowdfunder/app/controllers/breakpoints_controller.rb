class BreakpointsController < ApplicationController
	before_filter :load_project

	def show
	   @breakpoint = Breakpoint.find(params[:id])
	end

	  def create
	    @breakpoint = @project.reviews.build(breakpoint_params)
	    @breakpoint.user_id = current_user.id

	    if @breakpoint.save
	      redirect_to projects_url, notice: 'Breakpoint created successfully'
	    else
	      render 'projects/show'
	    end
	  end

	  def destroy
	    @breakpoint = Breakpoint.find(params[:id])
	    @breakpoint.destroy
	  end

	  private
	  def breakpoint_params
	    params.require(:breakpoint).permit(:amount, :description, :project_id, :pledge_id)
	  end

	  def load_project
	  	@project = Project.find(params[:project_id])
	  end

end
