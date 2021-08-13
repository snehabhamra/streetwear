class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :category
      t.string :image_url
      t.integer :buyer_id, optional: true
      t.integer :seller_id, optional: true

      t.timestamps
    end
  end
end
