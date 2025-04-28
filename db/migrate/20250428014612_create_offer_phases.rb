class CreateOfferPhases < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_phases do |t|
      t.datetime :offer_date
      t.integer :offer_amount
      t.datetime :start_date

      t.timestamps
    end
  end
end
