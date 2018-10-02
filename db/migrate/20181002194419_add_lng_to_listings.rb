class AddLngToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :lng, :float
  end
end
