class AddAvatarToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :avatar, :string
  end
end
