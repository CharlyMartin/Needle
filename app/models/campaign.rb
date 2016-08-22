class Campaign < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :title, presence: true
  validates :batch_size, presence: true
  validates :date_start, presence: true
  validates :sdate_end, presence: true
  validates :sspec, presence: true
  validates :sprice, presence: true
  validates :scategory, presence: true
end
