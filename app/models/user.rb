class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :responses
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true
  def current_total_score
    # return 42_069
    # get the responses that the user had
    # total up the score
    total_score = 0
    responses.each do |response|
      total_score += response.score
    end
    return total_score
  end

  def self.leaderboard_ranked
    all_users = all
    ranked_users = all_users.sort_by(&:current_total_score).reverse
    return ranked_users
  end
end
#  @users.second.responses.fourth.score
