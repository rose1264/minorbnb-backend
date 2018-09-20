class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.string :description
      t.integer :host_id
      t.integer :neighbourhood_id
    end
  end
end
