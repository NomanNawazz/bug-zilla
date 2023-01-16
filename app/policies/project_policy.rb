# frozen_string_literal: true

# Project Policy
class ProjectPolicy < ApplicationPolicy
 
  def index?
    user.present?
  end

  def new?
    user.manager?
  end

  def create?
    user.manager?
  end

  def edit?
    user.manager?
    # && user.id.eql?(record.manager_id)
  end

  def update?
    edit?
  end

  def show?
    user.present?
  end

  def destroy?
    edit?
  end

  def assgin_user?
    edit?
  end

  def unassgin_user?
    edit?
  end

end
