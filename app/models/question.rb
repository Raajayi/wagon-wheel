class Question < ApplicationRecord
  belongs_to :game
  has_many :answers
  has_many :responses
end
