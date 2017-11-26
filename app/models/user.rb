class User < ActiveRecord::Base
  has_many :user_trucks
  has_many :food_trucks, through: :user_trucks

  def slug
    name_array = self.name.split(" ")
    name_array.map{|name| name.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    slug_lower = slug.split("-").join(" ")
    User.where("lower(name) = '#{slug_lower}'").first
  end
end
