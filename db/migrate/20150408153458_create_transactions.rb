class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
