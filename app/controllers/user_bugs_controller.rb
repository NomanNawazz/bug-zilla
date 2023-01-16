# frozen_string_literal: true

# Bugs Controller
class UserBugsController < ApplicationController
  include UserBugsHelper
  before_action :set_bug, only: %i[create update]
  before_action :set_user, only: %i[destroy]

  def create
    authorize @bug, :assgin_bug?
    if current_user.bugs << @bug
      flash[:notice] = "Bug Assigned Successfully"
    else
      flash.now[:alert] = "Somethig went wrong!"
    end
    redirect_to request.referer
  end

  def update
    authorize @bug, :change_status?
    status = change_status(@bug)
    if @bug.update(status: status)
      flash[:notice] = "Bug Status Changed Successfully"
    else
      flash.now[:alert] = "Somethig went wrong!"
    end
    redirect_to request.referer
  end

  def destroy
    @bug = Bug.find(params[:id])
    authorize @bug, :unassgin_bug?
    if @user.bugs.delete(@bug)
      flash[:notice] = "Bug Unassigned Successfully"
    else
      flash.now[:alert] = "Somethig went wrong!"
    end
    redirect_to request.referer
  end

  private

  def set_bug
    @bug = Bug.find(params[:bug_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
