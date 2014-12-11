class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Authenticate user in all controllers using Devise
  # And whitelist the controllers that do not need authentication
  before_action :authenticate_user!
end
