class CreateDocumentScreeningHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :document_screening_histories do |t|
      t.references :document_screening, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.string :result
      t.text :feedback

      t.timestamps
    end
  end
end
