class ReviewSerializer < ActiveModel::Serializer
  attributes :rating, :description, :guest_id, :reservation_id

  belongs_to :guest, class_name: 'User'
  belongs_to :reservation
end
