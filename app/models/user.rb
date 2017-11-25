class User < ActiveRecord::Base
  has_many :user_trucks
  has_many :food_trucks, through: :user_trucks
end
