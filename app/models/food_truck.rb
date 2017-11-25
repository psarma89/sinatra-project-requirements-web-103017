class FoodTruck < ActiveRecord::Base
  has_many :user_trucks
  has_many :users, through: :user_trucks
end
