class AddUsernameAndCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :username, :string
  end
end
