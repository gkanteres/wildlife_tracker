class AddRegionToSightings < ActiveRecord::Migration
  def change
    add_reference :sightings, :region, index: true
  end
end
