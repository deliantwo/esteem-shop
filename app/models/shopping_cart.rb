class ShoppingCart < ActiveRecord::Base
    acts_as_shopping_cart
    
    def tax_pct
        Vat.find(Rails.application.config.current_vat_id).value
    end
    
    def add(object, price, quantity = 1, cumulative = true)
        cart_item = item_for(object)
        puts "lol"
        if cart_item
            cumulative = cumulative == true ? cart_item.quantity : 0
            cart_item.quantity = (cumulative + quantity)
            cart_item.save
            cart_item
        else
            shopping_cart_items.create(item: object, price: price, quantity: quantity)
        end
    end
end
