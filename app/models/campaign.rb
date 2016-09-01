class Campaign < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :batch_size, presence: true
  #validates :date_start, presence: true
  #validates :date_end, presence: true
  validates :duration, presence: true
  validates :spec, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :gender, presence: true
  has_attachments :photos, maximum: 5
  monetize :price_cents

  enum status_private: [:pending, :accepted, :declined]
  enum status_public: [:active, :in_production, :successful, :failed]

  scope :ending_in_days, -> (days) { active.select {|c| c.days_left <= days  } }
  scope :items_ordered, -> (items) { active.select {|c| c.items_sold > items  } }
  scope :latest, -> (number) { order('date_start DESC').limit(number) }



  # def self.ending_in_days(days)
  #   Campaign.active.select {|c| c.days_left <= days  }
  # end

  def close!
    self.success? ? self.successful! : self.failed!

  end

  def finished?
    return false unless self.date_end
    if Time.now > self.date_end
      true
    else
      false
    end
  end

  def live?
    return false unless self.date_end || self.date_start
    if self.date_start <= Time.now && Time.now <= self.date_end
      true
    else
      false
    end
  end

  def success?
    items_sold >= self.batch_size
  end

  def funded?
    items_sold >= (self.batch_size*3)/4 #-> pas closed
  end

  def launch!
    self.date_start = Time.now
    self.date_end = self.date_start + self.duration.days
    self.active!
  end

  def days_left
    return "-" unless self.live?
    ((self.date_end - Time.now) /86400).to_i
  end

  def items_sold
    self.orders
      .where(state: "paid")
      .reduce(0) { |sum, order| sum + order.number_of_items }
  end

end

