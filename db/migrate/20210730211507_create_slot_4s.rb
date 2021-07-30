class CreateSlot4s < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_4s do |t|
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
