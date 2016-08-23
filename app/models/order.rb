class Order < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  validates :item_size, presence: true
  validates :number_of_items, presence: true
  validates :delivery_address, presence: true

  validates :user_id, presence: true
  validates :campaign_id, presence: true
end
