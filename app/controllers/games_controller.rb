require 'set'

class GamesController < ApplicationController
  def index
    @games = Game.all
    @games_started = Game.started_games(current_user)
    @games_completed = Game.completed_games(current_user)
  end

  def show
    @game = Game.find(params[:id])
  end

  def score
    @game = Game.find(params[:id])
    @total_score = @game.total_score_for(current_user)
  end
end
