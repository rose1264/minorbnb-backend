class TripSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :guest_number, :file, :guest, :listing, :review

  # belongs_to :guest, class_name: 'User'
  # belongs_to :listing
  #
  # has_one :review

  def guest
    {
      id: object.guest.id,
      name: object.guest.name,
      avatar: object.guest.avatar,
      email: object.guest.email,
    }
  end
end
