class Game < ApplicationRecord
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses, through: :answers

  def total_score_for(user)
    responses.where(user: user).sum(:score)
  end
end
