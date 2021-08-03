class CreateSlotCs < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_cs do |t|
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
