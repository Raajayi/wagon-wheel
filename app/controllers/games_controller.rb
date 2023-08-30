class GamesController < ApplicationController
  def index
    @games = Game.all
    @games_completed = Game.all
    # Getting the user from the games, knowing which responses were chosen
    @games_long = Game.first.questions.first.answers.first.responses.first.user
    # Identify the current user
    @user = current_user
    # Find out the responses associated with that user
    responses = @user.responses.all
    # Find out which games those responses come from
    games_responses = responses.map do |response|
      response.answer.question.game
    end
    #
    # Pull together the records for those games
    @games_completed = games_responses.uniq

  end

  def show
    @game = Game.find(params[:id])
  end

  def score
    @game = Game.find(params[:id])
    @total_score = @game.total_score_for(current_user)
  end
end
