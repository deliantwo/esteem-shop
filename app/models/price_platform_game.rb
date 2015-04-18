class PricePlatformGame < ActiveRecord::Base
    has_many :gamekeys
    belongs_to :platform
    belongs_to :game
end
