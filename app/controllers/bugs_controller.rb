# frozen_string_literal: true

# BUGS Controller to add Bugs to a project that has a specific manager
class BugsController < ApplicationController
  include BugsHelper
  before_action :set_project, only: %i[new create show edit update destroy]
  before_action :set_bug, only: %i[show edit update destroy]
  before_action :set_bug_auth, only: %i[edit update destroy]

  def new
    authorize Bug
    @bug = Bug.new
  end

  def create
    authorize Bug
    @bug = @project.bugs.new(project_params)

    if @bug.save
      redirect_to project_path(@project)
      flash[:notice] = "Bug Created Successfully"
    else
      render :new
      flash.now[:alert] = "Somethig went wrong! Bug not created"
    end
  end

  def show; end

  def edit; end

  def update
    if @bug.update(project_params)
      redirect_to project_path(params[:project_id])
      flash[:notice] = "Bug Updated Successfully"
    else
      render :edit
      flash.now[:alert] = "Cant update project!"
    end

  end

  def destroy
    if @bug.destroy
      flash[:notice] = "Bug Destroyed Successfully"
    end

    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def set_bug_auth
    authorize @bug
  end

  def project_params
    params.require(:bug).permit(:title, :description, :status, :bug_type, :deadline, :user_id, :image)
  end
end
