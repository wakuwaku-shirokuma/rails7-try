class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.references :profile, null: false, foreign_key: true
      t.integer :work_type
      t.integer :working_hours
      t.integer :min_salary
      t.integer :max_salary
      t.string :tech_stack
      t.date :start_date
      t.text :skillset

      t.timestamps
    end
  end
end
