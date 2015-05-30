class Publisher < ActiveRecord::Base
    has_many :games
    
    rails_admin do
        label "Wydawca"
        label_plural "Wydawcy"
        
        field :name do
            label "Nazwa"
            required true
        end
    end
end
