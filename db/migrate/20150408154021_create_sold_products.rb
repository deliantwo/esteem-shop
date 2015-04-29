class CreateSoldProducts < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|
      t.integer :purchase_id
      t.integer :gamekey
      t.integer :vat_id
      t.decimal :price

      t.timestamps null: false
    end
  end
end
