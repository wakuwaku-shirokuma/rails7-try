class CreateDocumentScreeningPhases < ActiveRecord::Migration[7.0]
  def change
    create_table :document_screening_phases do |t|
      t.references :phaseable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
