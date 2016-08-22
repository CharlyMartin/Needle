class Following < ApplicationRecord
  belongs_to :designer, :class_name => 'User', :foreign_key => 'designer_id'
  belongs_to :follower, :class_name => 'User', :foreign_key => 'user_id'
end
