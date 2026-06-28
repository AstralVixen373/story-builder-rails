class CreateCharacterRelationships < ActiveRecord::Migration[8.1]
  def change
    create_table :character_relationships do |t|
      t.references :character, null: false, foreign_key: true
      t.references :linked_character, null: false, foreign_key: { to_table: :characters }

      t.timestamps
    end
  end
end
