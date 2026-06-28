class CreateScenes < ActiveRecord::Migration[8.1]
  def change
    create_table :scenes do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
