class Campaign < ApplicationRecord
  has_many :orders
  belongs_to :user
end
