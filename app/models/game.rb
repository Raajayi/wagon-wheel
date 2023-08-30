class Game < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses, through: :answers

  def total_score_for(user)
    responses.where(user: user).sum(:score)
  end

  def self.started_games(user)
    responses = user.responses.all
    unless responses.nil?
      games_responses = responses.map do |response|
        response.answer.question.game
      end
      return games_responses.uniq
    end
  end

  def self.completed_games(user)
    responses = user.responses.all

    unless responses.nil?
      questions_with_responses = responses.map { |response| response.answer.question }

      games_completed = started_games(user).select do |game|
        game.questions.to_set.subset?(questions_with_responses.to_set)
      end
      return games_completed
    end
  end
end
