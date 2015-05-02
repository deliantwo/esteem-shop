class CartController < ApplicationController
    before_filter :authenticate_user!, only: :checkout
    
    def detail_view
    end
    
    def checkout
    end
end
