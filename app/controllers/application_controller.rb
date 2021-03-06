class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!

def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :resource, :resource_name, :devise_mapping


  protected 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit( :first_name, :last_name, :email,:password,:password_confirmation,:company,:occupation,:role)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name,:email,:password,:company,:occupation,:password_confirmation, :current_password)}
  end
end
