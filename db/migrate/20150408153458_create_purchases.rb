class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id, default: false, null: false
      t.integer :status, default: false, null: false

      t.timestamps null: false
    end
  end
end
