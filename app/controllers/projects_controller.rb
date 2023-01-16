# frozen_string_literal: true

# Project Controller to add projects through a User
class ProjectsController < ApplicationController
  include ProjectsHelper
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_project_auth, only: %i[show edit update destroy]

  def index
    authorize Project
    @projects = if current_user.role == "sq"
        Project.all
      else
        current_user.projects
      end
  end

  def new
    authorize Project
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to projects_path
      flash[:notice] = "Project Created Successfully"
    else
      render :new
      flash[:alert] = "Somethig went wrong! Bug not created"
    end
    authorize @project
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path
      flash[:notice] = "Project Updated Successfully"
    else
      render :edit
      flash[:alert] = "Cant update project!"
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project Destroyed Successfully"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :manager_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_project_auth
    authorize @project
  end
end
