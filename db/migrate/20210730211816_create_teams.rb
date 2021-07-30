class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :slot_1, null: false, foreign_key: true
      t.references :slot_2, null: false, foreign_key: true
      t.references :slot_3, null: false, foreign_key: true
      t.references :slot_4, null: false, foreign_key: true

      t.timestamps
    end
  end
end
