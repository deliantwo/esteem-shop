class CreateSoldProducts < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|
      t.integer :purchase_id, default: false, null: false
      t.integer :gamekey_id, default: false, null: false
      t.integer :vat_id, default: false, null: false
      t.decimal :price, default: false, null: false

      t.timestamps null: false
    end
  end
end
