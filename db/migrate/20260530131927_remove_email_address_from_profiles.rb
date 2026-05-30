class RemoveEmailAddressFromProfiles < ActiveRecord::Migration[8.1]
  def change
    remove_column :profiles, :email_address, :string
  end
end
