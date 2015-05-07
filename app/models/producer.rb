class Producer < ActiveRecord::Base
    has_many :games
    
    rails_admin do
        label "Producent"
        label_plural "Producenci"
        
        field :id
        field :name do
            label "Nazwa"
        end
    end
end
