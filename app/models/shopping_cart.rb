class ShoppingCart < ActiveRecord::Base
    acts_as_shopping_cart
    
    def tax_pct
        Vat.find(Rails.application.config.current_vat_id).value
    end
end
