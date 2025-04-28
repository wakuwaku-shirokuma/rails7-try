class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :phase_type

      t.timestamps
    end
  end
end
