class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attachment :photo

  # has_many :followings, foreign_key: 'follower_id', dependent: :destroy
  # has_many :followers, through: :followings, foreign_key: 'follower_id'
  # has_many :designers, through: :followings, foreign_key: 'designer_id'

  has_many :followers, :class_name => "Following", :foreign_key => :designer_id
  has_many :designers, :class_name => "Following", :foreign_key => :follower_id

  has_many :orders, dependent: :destroy
  has_many :campaigns, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  scope :of_the_month, -> { select("users.*, COUNT(followings.id) AS followings_count").joins("JOIN followings ON followings.designer_id = users.id").group('users.id').order("followings_count DESC").first }

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def following designer
    designers.find_by(designer: designer)
  end

  # def following follower
  #   designers.find_by(follower: follower)
  # end

  def follow? designer
    !!following(designer)
  end
end
