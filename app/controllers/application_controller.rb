class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      registration_params = [
        :username, :fullname,
        :email,:phone, :password, :password_confirmation,
        :avatar, :avatar_cache, :remove_avatar,
        :coverphoto, :coverphoto_cache, :remove_coverphoto
      ]     

      if params[:action] == 'update'
        devise_parameter_sanitizer.permit(:account_update, keys: registration_params)
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)      
      end
    end
end
