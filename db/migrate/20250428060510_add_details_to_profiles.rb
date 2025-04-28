class AddDetailsToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :full_name, :string
    add_column :profiles, :email, :string
    add_column :profiles, :phone_number, :string
    add_column :profiles, :birthdate, :date
    add_column :profiles, :address, :string
  end
end
