class CreateSlotBs < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_bs do |t|
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
