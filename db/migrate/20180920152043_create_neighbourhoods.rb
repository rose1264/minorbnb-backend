class CreateNeighbourhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighbourhoods do |t|
      t.string :name
      t.integer :city_id
    end
  end
end
