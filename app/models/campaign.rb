class Campaign < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :title, presence: true
  validates :batch_size, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :spec, presence: true
  validates :price, presence: true
  validates :category, presence: true
end
