class CreateFoodTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :category
      t.integer :location_id
    end
  end
end
