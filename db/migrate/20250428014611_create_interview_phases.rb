class CreateInterviewPhases < ActiveRecord::Migration[7.0]
  def change
    create_table :interview_phases do |t|
      t.datetime :interview_date
      t.string :interviewer
      t.integer :evaluation_score

      t.timestamps
    end
  end
end
