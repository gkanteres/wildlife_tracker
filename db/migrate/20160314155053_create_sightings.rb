class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.date :date
      t.string :latitude
      t.string :longitude
      t.belongs_to :species

      t.timestamps null: false
    end
  end
end
