class Response < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  def correct?
    answer.correct
  end

  def eval_score
    self.score = correct? ? 1 : -1
  end
end
