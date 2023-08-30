class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true

  # skip_before_action :verify_authenticity_token

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end

  def after_update_path
    profile_path
  end
  def after_update_path_for(resource)
    profile_path
  end
end
