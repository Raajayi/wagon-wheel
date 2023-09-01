class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :responses
  has_one_attached :headshot
  has_one_attached :full_body

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
end
