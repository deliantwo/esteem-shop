class CreateVats < ActiveRecord::Migration
  def change
    create_table :vats do |t|
      t.decimal :value

      t.timestamps null: false
    end
  end
end
