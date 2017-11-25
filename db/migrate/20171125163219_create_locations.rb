class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :neighborhood
      t.integer :zipcode
    end
  end
end
