class AddFileToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :file, :string
  end
end
