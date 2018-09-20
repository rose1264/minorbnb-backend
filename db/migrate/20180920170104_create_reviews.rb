class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.integer :guest_id
      t.integer :reservation_id
    end
  end
end
