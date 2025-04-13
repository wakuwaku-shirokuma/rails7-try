class AddSalesforceIdToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :salesforce_id, :string
    add_index :companies, :salesforce_id, unique: true
  end
end
