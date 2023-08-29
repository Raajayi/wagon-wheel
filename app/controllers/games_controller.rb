class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def score
    @game = Game.find(params[:id])
    @total_score = @game.total_score_for(current_user)
  end
end
