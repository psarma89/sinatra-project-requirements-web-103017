class FoodTruck < ActiveRecord::Base
  has_many :user_trucks
  has_many :users, through: :user_trucks
  belongs_to :location

  def slug
    name_array = self.name.split(" ")
    name_array.map{|name| name.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    slug_lower = slug.split("-").join(" ")
    FoodTruck.where("lower(name) = '#{slug_lower}'").first
  end

end
