class ReservationSerializer < ActiveModel::Serializer
  attributes :check_in, :check_out, :guest_number

  belongs_to :guest, class_name: 'User'
  belongs_to :listing

  has_one :review
end
