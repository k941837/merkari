class CreateItems < ActiveRecord::Migration[5.0]
  def change

    create_table :brands do |t|
      t.string :name
      t.string :ancestry, index: true
    end

    create_table :categories do |t|
      t.string :name
      t.string :ancestry, index: true
    end


    create_table :items do |t|
      t.string :title
      t.string :description
      # t.references :brand
      # t.references :category
      # t.references :user, null: false, foreign_key: true
      t.integer :prefecture_id
      t.integer :shipping_charger_id
      t.integer :shipping_method_id
      t.integer :days_to_ship_id
      t.integer :item_status_id
      t.integer :trade_status_id
      t.integer :price
      t.timestamps

    end
  end
end
