class Following < ApplicationRecord
  belongs_to :designer, :class_name => 'User', foreign_key: 'designer_id'
  belongs_to :follower, :class_name => 'User', foreign_key: 'follower_id'
  # belongs_to :user
  # belongs_to :followed, :class_name => 'User'


  # validates :designer, presence: true
  # validates :follower, presence: true
end
