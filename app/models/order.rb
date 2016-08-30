class Order < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  validates :item_size, presence: true
  validates :number_of_items, presence: true

  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  validates :user_id, presence: true
  validates :campaign_id, presence: true

  validate :user_cannot_order_from_own_campaign

  monetize :amount_cents

  def full_address
    "#{address}, #{zip_code} #{city} #{ISO3166::Country[country].name}"
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end

  def user_cannot_order_from_own_campaign
    if self.campaign.user == self.user
      errors.add(:user, "can't order from own campaign")
    end
  end
end
