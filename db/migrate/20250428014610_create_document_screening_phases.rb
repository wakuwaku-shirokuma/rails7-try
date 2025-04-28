class CreateDocumentScreeningPhases < ActiveRecord::Migration[7.0]
  def change
    create_table :document_screening_phases do |t|
      t.datetime :screened_at
      t.string :reviewer
      t.string :result
      t.text :note

      t.timestamps
    end
  end
end
