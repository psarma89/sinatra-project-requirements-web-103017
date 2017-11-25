class CreateUserTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_trucks do |t|
      t.integer :user_id
      t.integer :food_truck_id
    end
  end
end
