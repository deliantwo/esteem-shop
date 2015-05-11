class Platform < ActiveRecord::Base
    has_many :price_platform_games
    #has_many :games, through: :price_platform_game
    
    rails_admin do
        label "Platforma"
        label_plural "Platformy"
        
        field :name do
            label "Nazwa"
        end
    end
end
