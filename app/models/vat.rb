class Vat < ActiveRecord::Base
    has_many :sold_products
    validates_numericality_of :value, :greater_than_or_equal_to => 0
    
    
    def custom_label_method
        "#{self.value}%"
    end
  
    rails_admin do
        label "VAT"
        label_plural "VAT"
        object_label_method  :custom_label_method
        
        field :value do
            label "Wartość"
            required true
        end

    end
end
