class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.integer :category_id
      t.integer :producer_id
      t.string :image_url
      t.integer :publisher_id

      t.timestamps null: false
    end
  end
end
