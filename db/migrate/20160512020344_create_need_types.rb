class CreateNeedTypes < ActiveRecord::Migration
  def change
    create_table :need_types do |t|
      t.string :name
      t.text :description
      t.integer :cost
      t.string :image_url
      t.string :slug
      t.string :category

      t.timestamps null: false
    end
  end
end
