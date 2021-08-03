class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :slot_a, null: false, foreign_key: true
      t.references :slot_b, null: false, foreign_key: true
      t.references :slot_c, null: false, foreign_key: true
      t.references :slot_d, null: false, foreign_key: true

      t.timestamps
    end
  end
end
