class Producer < ActiveRecord::Base
    has_many :games
    
    rails_admin do
        label "Producent"
        label_plural "Producenci"
        
        field :name do
            label "Nazwa"
            required true
        end
    end
end
