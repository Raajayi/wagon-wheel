class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :responses
  has_one_attached :headshot
  has_one_attached :full_body
  has_many :game_sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true
  def current_total_score
    total_score = 0
    responses.each { |response| total_score += response.score }
    return total_score
  end

  def self.leaderboard_ranked
    all.sort_by(&:current_total_score).reverse
  end

  def game_score(game)
    responses.where(question: game.questions).pluck(:score).sum
  end

  def old_game_score(game)
    responses.where(question: game.questions).order("created_at DESC").offset(1).pluck(:score).sum
  end
end
