class CreateGamekeys < ActiveRecord::Migration
  def change
    create_table :gamekeys do |t|
      t.string :content
      t.integer :user_id
      t.integer :price_platform_game_id

      t.timestamps null: false
    end
  end
end
