class Location < ActiveRecord::Base
  has_many :food_trucks

  def slug
    neighborhood_array = self.neighborhood.split(" ")
    neighborhood_array.map{|name| name.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    slug_lower = slug.split("-").join(" ")
    Location.where("lower(neighborhood) = '#{slug_lower}'").first
  end

end
