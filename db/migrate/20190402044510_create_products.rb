class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :favorites_count, default: 0
      t.integer :price, null: false
      t.string :image1
      t.string :image2
      t.string :image3
      t.boolean :sold_flg, default: false
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
