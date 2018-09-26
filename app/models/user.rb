class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :name, uniqueness: { case_sensitive: false }

  has_many :listings, foreign_key: 'host_id'
  has_many :trips, class_name: 'Reservation', foreign_key: 'guest_id'
  has_many :reservations, through: :listings
  has_many :reviews, foreign_key: 'guest_id'
end
