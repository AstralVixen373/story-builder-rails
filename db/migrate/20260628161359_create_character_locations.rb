class CreateCharacterLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :character_locations do |t|
      t.references :character, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
