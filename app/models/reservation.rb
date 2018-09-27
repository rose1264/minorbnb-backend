class Reservation < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :guest, class_name: 'User'
  belongs_to :listing

  has_one :review
end
