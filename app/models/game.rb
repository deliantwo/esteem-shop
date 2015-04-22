class Game < ActiveRecord::Base
    has_many :price_platform_games
    belongs_to :category
    belongs_to :publisher
    belongs_to :producer
    #has_many :platforms, through: :price_platform_game
end
