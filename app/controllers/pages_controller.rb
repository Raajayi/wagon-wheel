class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing ]

  def index
  end

  def landing
  end

  def profile
    # @user_first_name = current_user.first_name.nil? ? "Friend" : current_user.first_name
    @user_first_name = current_user.first_name
    @user_last_name = current_user.last_name
    @user_email = current_user.email
  end
end
