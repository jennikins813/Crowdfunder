class PledgesController < ApplicationController
  	def new
  	end

  	def create
		@pledge = @project.pledges.build(pldege_params)
		#@pledge = Pledge.new(pledge_params) --> if above doesn't work
		@pledge.user_id = current_user.id

	respond_to do |format|
		if @pledge.save
			format.html {redirect_to @project, notice: "Pledge added"}
			format.js {}
		else
			format.html {render 'projects/show', alert: "There was an error"}
			format.js {}
		end

	end

	private
	def pledge_params
		params.require(:pledge).permit(:project_id, :reward_id, :user_id)
	end
	
	def load_project
		@project = Project.find(params[:project_id])	
end
