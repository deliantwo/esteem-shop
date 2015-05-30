class Game < ActiveRecord::Base
    has_many :price_platform_games
    belongs_to :category
    belongs_to :publisher
    belongs_to :producer
    #has_many :platforms, through: :price_platform_game
    
    rails_admin do
        label "Gra"
        label_plural "Gry"
        
        field :name do
            label "Nazwa gry"
            required true
        end
        field :description do 
            label "Opis gry"
        end
        field :category do
            label "Kategoria"
            required true
        end
        field :producer do
            label "Producent"
            required true
        end
        field :publisher do
            label "Wydawca"
            required true
        end
    end
end
