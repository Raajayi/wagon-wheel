require 'set'

class GamesController < ApplicationController
  def index
    @games = Game.all
    @games_started = Game.started_games(current_user)


    # Get the user's responses
    responses = current_user.responses.all
    # Get a list of the questions for the responses
    @questions_with_responses = []
    responses.each do |response|
      @questions_with_responses << response.answer.question
    end

    @games_completed = @games_started.select do |game|
      @questions_from_started_game = []
      game.questions.each do |question|
        @questions_from_started_game << question
      end
      @questions_from_started_game.to_set.subset?(@questions_with_responses.to_set)
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def score
    @game = Game.find(params[:id])
    @total_score = @game.total_score_for(current_user)
  end
end
