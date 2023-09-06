class GameSession < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def current_users
    User.joins(:game_sessions).where("game_sessions.id=?", id)
  end
end
