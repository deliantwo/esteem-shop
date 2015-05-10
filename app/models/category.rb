class Category < ActiveRecord::Base
    has_many :games
    
    rails_admin do
        label "Kategoria"
        label_plural "Kategorie"
        
        field :name do
            label "Nazwa"
        end
    end
end
