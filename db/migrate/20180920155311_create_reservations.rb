class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :guest_number
      t.integer :guest_id
      t.integer :listing_id
    end
  end
end
