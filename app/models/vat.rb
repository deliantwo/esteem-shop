class Vat < ActiveRecord::Base
    has_many :sold_products
    
    
    def custom_label_method
        "#{self.value}%"
    end
  
    rails_admin do
        label "VAT"
        label_plural "VAT"
        object_label_method  :custom_label_method
        
        field :id
        field :value do
            label "Wartość"
        end

    end
end
