class ReviewSerializer < ActiveModel::Serializer
  attributes :rating, :description

  belongs_to :guest, class_name: 'User'
  belongs_to :reservation
end
