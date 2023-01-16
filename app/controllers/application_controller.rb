# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  include Pundit
  before_action :update_allowed_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :not_authorize
  # rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def not_authorize
    flash[:alert] = 'you are not authorized for this task'
    redirect_to request.referer || root_path
  end

  def record_not_found
    flash[:alert] = 'Record not found!'
    redirect_to request.referer || root_path
  end


  # def invalid_record
  #   flash[:alert] = 'Invalid Record!'
  #   redirect_to request.referer || root_path
  # end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :role, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :role, :email, :password, :current_password)
    end
  end
end
