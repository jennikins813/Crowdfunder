class RewardsController < ApplicationController
	before_filter :load_project

	def show
	   @reward = Reward.find(params[:id])
	end

	  def create
	    @reward = @project.rewards.build(reward_params)
	    @reward.user_id = current_user.id

	    if @reward.save
	      redirect_to projects_url, notice: 'Reward created successfully'
	    else
	      render 'projects/show'
	    end
	  end

	  def destroy
	    @reward = Reward.find(params[:id])
	    @breward.destroy
	  end

	  private
	  def reward_params
	    params.require(:reward).permit(:amount, :description, :project_id, :pledge_id)
	  end

	  def load_project
	  	@project = Project.find(params[:project_id])
	  end

end
