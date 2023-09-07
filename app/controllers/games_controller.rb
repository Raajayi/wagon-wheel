require 'set'

class GamesController < ApplicationController
  def index
    @games = Game.all
    @games_started = Game.started_games(current_user)
    @games_completed = Game.completed_games(current_user)

    @games_in_session = GameSession.where(user_id: current_user.id)

    @user_first_name = current_user.first_name
    @user_last_name = current_user.last_name
    @user_email = current_user.email

    @games_remaining = Game.all - Game.started_games(current_user)

    @users = User.leaderboard_ranked
    @games_count = {}
    @games_count[:all] = Game.all.size
    @games_count[:started] = Game.started_games(current_user).size
    @games_count[:completed] = Game.completed_games(current_user).size


    @games_remaining_count = @games_count[:all] - @games_in_session.count

  end

  def show
    @game = Game.find(params[:id])
    @game_session = GameSession.create(game: @game, user: current_user) if GameSession.find_by(game: @game, user: current_user).nil?
    @users = User.all.first(7) # just for the demo incase other ppl join during presentation
    GameChannel.broadcast_to(
      @game,
      {
        userId: current_user.id,
        name: current_user.first_name
      }
    )
  end

  def score
    sleep(5)
    @game = Game.find(params[:id])
    @total_score = @game.total_score_for(current_user)

    @users = @game.responses.map(&:user).uniq.sort_by do |user|
      -user.game_score(@game)
    end

    GameSession.find_by(game: @game, user: current_user)&.destroy
  end
end
