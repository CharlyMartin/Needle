class Campaign < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :title, presence: true
  validates :batch_size, presence: true
  #validates :date_start, presence: true
  #validates :date_end, presence: true
  validates :duration, presence: true
  validates :spec, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :gender, presence: true
  has_attachment :photo

  enum status_private: [:pending, :accepted, :declined]
  enum status_public: [:active, :in_production, :successful, :failed]


  def close!
    success? ? successful! : failed!
  end

  def finished?
    if Time.now > self.date_end

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

  def success?
    self.orders.count == self.batch_size  #-> closed
  end

  def funded?
    self.orders.count >= (self.batch_size*3)/4 #-> pas closed
  end

  def launch!
    self.date_start = Time.now
    self.date_end = self.date_start + self.duration.days
    self.active!
  end
end


 # si status_private = accepted alors on affiche un bouton
 # "launch" qui, quand il est cliqué fait un date_start = Time.now
 # et un date_end = date_start + @campaign.duration et permet d'afficher
 #  la campagne dans celles en cours (index) et change son status_public pr
 #   qu'il passe à on-going
