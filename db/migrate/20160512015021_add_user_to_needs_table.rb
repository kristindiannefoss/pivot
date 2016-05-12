class AddUserToNeedsTable < ActiveRecord::Migration
  def change
    add_reference :needs, :user, index: true, foreign_key: true
  end
end
