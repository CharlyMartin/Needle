class Order < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  validates :model_size
  validates :number_of_item
  validates :delivery_address

  validates :user_id, presence: true
  validates :campaign_id, presence: true
end
