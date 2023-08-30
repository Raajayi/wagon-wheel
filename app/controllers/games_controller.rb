require 'set'

class GamesController < ApplicationController
  def index
    @games = Game.all
    @games_started = Game.started_games(current_user)
    # Getting the user from the games, knowing which responses were chosen
    # @games_long = Game.first.questions.first.answers.first.responses.first.user
    # Identify the current user
    # @user = current_user
    # # Find out the responses associated with that user
    # responses = @user.responses.all
    # # Find out which games those responses come from
    # games_responses = responses.map do |response|
    #   response.answer.question.game
    # end
    # #
    # # Pull together the records for those games
    # @games_completed = games_responses.uniq
    # @games_completed = Game.all

    # A completed game is a game for which there is a response for every question
    # in each of the games that have been started

    # Get the user's responses
    responses = current_user.responses.all
    # Get a list of the questions for the responses
    @questions_with_responses = []
    responses.each do |response|
      @questions_with_responses << response.answer.question
    end

    # For each games_started
    # Get all their questions
    # Check to see if their questions have all been responded to, if yes then complete

    @games_completed = @games_started.select do |game|
      @questions_from_started_game = []
      game.questions.each do |question|
        @questions_from_started_game << question
      end
      @questions_from_started_game in @questions_with_responses

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
