class Game < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses, through: :answers

  def total_score_for(user)
    responses.where(user: user).sum(:score)
  end

  def self.started_games(user)
    responses = user.responses.all
    # Find out which games those responses come from
    unless responses.nil?
      games_responses = responses.map do |response|
        response.answer.question.game
      end
    end

    # Pull together the records for those games
    return games_responses.uniq
  end
end
