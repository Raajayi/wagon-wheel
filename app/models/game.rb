class Game < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions
  has_many :answers, through: :questions
  has_many :game_sessions
  has_many :users, through: :game_sessions

  def played_users
    responses.map(&:user).uniq
  end

  def total_score_for(user)
    responses.where(user: user).sum(:score)
  end

  def self.started_games(user)
    responses = user.responses.all
    unless responses.nil?
      games_responses = responses.map do |response|
        response.question.game
      end
      return games_responses.uniq
    end
  end

  def self.games_in_session(user)
    GameSessions.where(user_id: user.id)
  end

  def self.completed_games(user)
    responses = user.responses.all
    unless responses.nil?
      questions_with_responses = responses.map { |response| response.question }

      games_completed = started_games(user).select do |game|
        game.questions.to_set.subset?(questions_with_responses.to_set)
      end
      return games_completed
    end
  end

end
