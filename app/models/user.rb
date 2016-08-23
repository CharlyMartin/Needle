class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :followings, foreign_key: 'designer_id',dependent: :destroy
  has_many :followers, through: :followings, foreign_key: 'follower_id'

  has_many :orders, dependent: :destroy
  has_many :campaigns, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
