class Question < ApplicationRecord
  belongs_to :game
  has_many :answers
  has_many :responses

  def correct_answer
    answers.select {|answer| answer.correct == true}
  end

  def total_score_for(user)
    responses.where(user: user).sum(:score)
  end

end
