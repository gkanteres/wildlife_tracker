class Sighting < ActiveRecord::Base

  belongs_to :species
  belongs_to :region
  validates :date, :presence => true

end
