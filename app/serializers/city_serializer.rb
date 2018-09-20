class CitySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :neighbourhoods
  has_many :listings, :through => :neighbourhoods
end
