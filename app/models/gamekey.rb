class Gamekey < ActiveRecord::Base
    belongs_to :user
    has_one :sold_product
    belongs_to :price_platform_game
end
