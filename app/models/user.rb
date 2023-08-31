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
  def current_points
    return 42_069
    # get the responses that the user had
    # total up the score
  end
end
