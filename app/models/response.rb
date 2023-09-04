class Response < ApplicationRecord
  belongs_to :answer, optional: true
  belongs_to :user
  belongs_to :question

  def correct?
    answer.nil? ? false : answer.correct
  end

  def eval_score
    # self.score = correct? ? 1 : -1
    self.score = correct? ? 1 : 0
  end
end
