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

  def leaderboard
    @users = User.leaderboard_ranked
    @games_count = {}
    @games_count[:all] = Game.all.size
    @games_count[:started] = Game.started_games(current_user).size
    @games_count[:completed] = Game.completed_games(current_user).size
  end

  def results
  end

  def statistics
  end
end
