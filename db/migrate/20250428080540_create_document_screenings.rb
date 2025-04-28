class CreateDocumentScreenings < ActiveRecord::Migration[7.0]
  def change
    create_table :document_screenings do |t|
      t.references :document_screening_phase, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
