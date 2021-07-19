class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :characters, null: false, foreign_key: true

      t.timestamps
    end
  end
end
