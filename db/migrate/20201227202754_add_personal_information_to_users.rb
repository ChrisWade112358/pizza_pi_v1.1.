class AddPersonalInformationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :employee, :boolean, default: false
    add_column :users, :manager, :boolean, default: false
    add_column :users, :address, :string
  end
end
