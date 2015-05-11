class Gamekey < ActiveRecord::Base
    belongs_to :user
    has_one :sold_product
    belongs_to :price_platform_game
    
    def custom_label_method
        "#{self.content}"
    end
    
    rails_admin do
        label "Klucz"
        label_plural "Klucze"
        object_label_method  :custom_label_method
        
        field :user do
            label "Użytkownik"
        end
        field :content do
            label "Zawartość"
        end
        field :price_platform_game do
            label "Gra"
        end
        field :sold_product do
            label "Sprzedany produkt"
        end
        
    end
end
