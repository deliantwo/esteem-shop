class Gamekey < ActiveRecord::Base
    belongs_to :user
    belongs_to :sold_product
    belongs_to :price_platform_game
end
