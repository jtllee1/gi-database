class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :title
      t.integer :rarity
      t.string :element
      t.date :birthday
      t.text :description

      t.timestamps
    end
  end
end
