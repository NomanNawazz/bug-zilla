# frozen_string_literal: true

# Bug Policy
class BugPolicy < ApplicationPolicy


  def new?
    user.sq?
  end

  def create?
    user.sq?
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def show?
    user.present?
  end

  def destroy?
    user.sq?
  end

  def assgin_bug?
    user.developer?
  end

  def unassgin_bug?
    user.developer? && user.id == record.user_id
  end

  def change_status?
    unassgin_bug?
  end


end
