class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :name
      t.text :description
      t.integer :cost
      t.integer :raised, default: 0
      t.string :image_url
      t.timestamps null: false
      t.text :description
    end
  end
end
