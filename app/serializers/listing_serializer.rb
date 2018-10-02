class ListingSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :address, :description, :avatars, :lat, :lng

  belongs_to :host, class_name: 'User'
  belongs_to :neighbourhood

  has_many :reservations
  has_many :guests, through: :reservations, class_name: 'User'
  has_many :reviews, through: :reservations
end
