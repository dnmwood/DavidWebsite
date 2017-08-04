class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to project_url
      else
        render :new
      end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
      if @project.destroy
        redirect_to project_url
      end
  end

private
  def project_params
    params.require(:project).permit(:title, :description, :image)
  end
end
