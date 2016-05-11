class RemoveStateAndZipcodeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :state, :string
    remove_column :users, :zipcode, :string
  end
end
