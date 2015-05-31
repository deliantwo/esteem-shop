class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name, default: false, null: false

      t.timestamps null: false
    end
  end
end
