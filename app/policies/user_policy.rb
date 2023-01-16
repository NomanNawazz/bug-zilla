# frozen_string_literal: true

# User Policy
class UserPolicy < ApplicationPolicy

  # def index?
  #   user.manager?
  # end

  def all_users?
    user.manager?
  end
end
