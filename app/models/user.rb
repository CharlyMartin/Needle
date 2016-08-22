class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :followings
  has_many :orders
  has_many :campaigns
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
