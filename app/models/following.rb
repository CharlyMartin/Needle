class Following < ApplicationRecord
  belongs_to :designer, :class_name => 'User'
  belongs_to :follower, :class_name => 'User'

  validates :designer, presence: true
  validates :follower, presence: true
end
