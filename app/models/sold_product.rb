class SoldProduct < ActiveRecord::Base
    belongs_to :gamekey
    belongs_to :purchase
    belongs_to :vat
    
    def custom_label_method
        unless self.purchase.nil? then
            return "Zamówienie ##{self.purchase.id} - #{self.gamekey.price_platform_game.game.name} (#{self.gamekey.price_platform_game.platform.name})"
        end
        return ""
    end
    
    rails_admin do
        label "Sprzedany produkt"
        label_plural "Sprzedane produkty"
        object_label_method  :custom_label_method
        
        field :purchase do
            label "Zamówienie"
        end
        field :gamekey do 
            label "Klucz"
        end
        field :vat
        field :price do
            label "Cena"
        end
    end
end
