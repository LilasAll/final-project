# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  #----------------------Permet d'avoir des paramètres en plus de l'email et du mdp enregistrés pour l'user
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:pseudo, :first_name, :last_name, :description, :city, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :description, :city, :email, :password, :password_confirmation, :current_password) }
  end

  private

  #def set_time_zone
  #  Time.zone = current_user.time_zone
  #end

end
