class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_shopping_cart

  private

  def set_shopping_cart
    @shopping_cart = ShoppingCart.create
  end
  
end
