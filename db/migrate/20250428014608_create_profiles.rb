class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :status
      t.references :office, null: false, foreign_key: true

      t.timestamps
    end
  end
end
