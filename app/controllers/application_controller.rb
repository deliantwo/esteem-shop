class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_shopping_cart

  private

  def set_shopping_cart
    if id = session[:cart_id]
      @shopping_cart = ShoppingCart.find(id)
    else
      @shopping_cart = ShoppingCart.create
      session[:cart_id] = @shopping_cart.id
    end
  end
  
end
