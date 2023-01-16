# frozen_string_literal: true

# Project User Controller
class ProjectUsersController < ApplicationController
  before_action :set_project, only: %i[create destroy]
  before_action :set_user, only: %i[create]

  def index
    authorize User, :all_users?
    @users = User.all
  end

  def create
    authorize @project, :assgin_user?
    if @project.users.exists?(params[:user_id])
      flash[:alert] = "User is already Assigned"
    else
      @project.users << @user
      flash[:notice] = "User Assigned Successfully"
    end
    redirect_to project_path(@project.id)
  end

  def destroy

    authorize @project, :unassgin_user?
    if @project.users.delete(params[:user_id])
      flash[:notice] = "User Deleted Successfully"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to project_path(@project.id)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
