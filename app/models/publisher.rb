class Publisher < ActiveRecord::Base
    has_many :games
    
    rails_admin do
        label "Wydawca"
        label_plural "Wydawcy"
        
        field :id
        field :name do
            label "Nazwa"
        end
    end
end
