class CartController < ApplicationController
    def detail_view
    end
    
    def checkout
        @vat = Vat.find(Rails.application.config.current_vat_id).value / 100.00
    end
end
