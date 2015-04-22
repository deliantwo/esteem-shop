class Platform < ActiveRecord::Base
    has_many :price_platform_games
    #has_many :games, through: :price_platform_game
end
