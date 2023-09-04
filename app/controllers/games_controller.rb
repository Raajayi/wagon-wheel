require 'set'

class GamesController < ApplicationController
  def index
    @games = Game.all
    @games_started = Game.started_games(current_user)
    @games_completed = Game.completed_games(current_user)

    @user_first_name = current_user.first_name
    @user_last_name = current_user.last_name
    @user_email = current_user.email

    @games_remaining = Game.all - Game.started_games(current_user)

    @users = User.leaderboard_ranked
    @games_count = {}
    @games_count[:all] = Game.all.size
    @games_count[:started] = Game.started_games(current_user).size
    @games_count[:completed] = Game.completed_games(current_user).size


    @games_remaining_count = @games_count[:all] - @games_count[:started]

  end

  def show
    @users = User
    @game = Game.find(params[:id])
  end

  def score
    @game = Game.find(params[:id])
    @total_score = @game.total_score_for(current_user)
  end
end
