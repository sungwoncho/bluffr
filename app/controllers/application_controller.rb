class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Authenticate user in all controllers using Devise
  # And whitelist the controllers that do not need authentication
  before_action :authenticate_user!
  
  # Devise strong parameter configuration
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:username,
          :email, :password, :password_confirmation)
      end
    end
end
