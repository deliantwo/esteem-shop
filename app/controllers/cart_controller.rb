class CartController < ApplicationController
    before_filter :authenticate_user!, only: :checkout
    
    def detail_view
        if @shopping_cart.total_unique_items == 0
            redirect_to root_path
        end
    end
    
    def checkout
        if @shopping_cart.total_unique_items == 0
            redirect_to root_path
        end
    end
end
