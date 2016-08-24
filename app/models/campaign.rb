class Campaign < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :title, presence: true
  validates :batch_size, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  #validates :duration, presence: true
  validates :spec, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :gender, presence: true
  has_attachment :photo

  def finished!

  end

  def finished?
    if Time.now > self.date_end
      true
    else
      false
    end
  end

  def live?
    if self.date_start <= Time.now && Time.now <= self.date_end
      true
    else
      false
    end
  end

end
