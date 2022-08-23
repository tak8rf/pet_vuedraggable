class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    include FamiliesHelper
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :family_id])
      devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :name, :family_id) }
      devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :name, :family_id) }
    end

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end
end
