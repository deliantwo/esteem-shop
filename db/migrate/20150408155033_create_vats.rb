class CreateVats < ActiveRecord::Migration
  def change
    create_table :vats do |t|
      t.decimal :value, default: false, null: false

      t.timestamps null: false
    end
  end
end
