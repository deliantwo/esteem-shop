class Game < ActiveRecord::Base
    has_many :price_platform_games
    belongs_to :category
    belongs_to :publisher
    belongs_to :producer
    #has_many :platforms, through: :price_platform_game
    
    rails_admin do
        label "Gra"
        label_plural "Gry"
        
        field :id
        field :name do
            label "Nazwa gry"
        end
        field :description do 
            label "Opis gry"
        end
        field :category do
            label "Kategoria"
        end
        field :producer do
            label "Producent"
        end
        field :publisher do
            label "Wydawca"
        end
    end
end
