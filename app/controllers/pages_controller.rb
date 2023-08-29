class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing ]

  def index
  end

  def landing
  end
end
