class Location < ApplicationRecord
  validates :name, presence: true
  validates :weather, presence: true

  geocoded_by :address
  after_validation :geocode

end
