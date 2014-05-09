class ProjectsController < ApplicationController
  before_filter :require_login, :except => [:index, :show]
  
  def index
    #@projects = Project.all
    @projects = if params[:search]
      Project.where("title LIKE ?", "%#{params[:search]}%")
    else
      Project.all
    end

    @projects = @projects.page(params[:page]).order(created_at: :asc)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @project = Project.find(params[:id])

    #if current_user
    #  @reward = @project.rewards.build
    #end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path  
  end

  private
  def project_params
    params.require(:project).permit(:title, :blurb, :funding_goal, :start_date, :end_date)
  end

end
