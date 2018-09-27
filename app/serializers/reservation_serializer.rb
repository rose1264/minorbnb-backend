class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :guest_number, :file

  belongs_to :guest, class_name: 'User'
  belongs_to :listing

  has_one :review
end
