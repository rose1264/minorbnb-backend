class NeighbourhoodSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :city
  has_many :listings
end
