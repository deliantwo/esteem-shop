class PaymentController < ApplicationController
  before_filter :authenticate_user!
  def index
    @current_items = @shopping_cart.shopping_cart_items
    @current_price = @shopping_cart.total
    paypal_options = {
    no_shipping: true, # if you want to disable shipping information
    allow_note: false, # if you want to disable notes
    pay_on_paypal: true # if you don't plan on showing your own confirmation step
    }
  
    request = Paypal::Express::Request.new(
      :username   => "esteembusiness_api1.gmail.com",
      :password   => "YFAHKSWRLTMQNBMZ",
      :signature  => "AFcWxV21C7fd0v3bYYYRCpSSRl31AUiHnZsA0bO2uIzZNs2hOTDwdWM7"
    )
    payment_request = Paypal::Payment::Request.new(
      :currency_code => "PLN",   # if nil, PayPal use USD as default
      :description   => "Klucze do gier",    # item description
      :quantity      => 1,      # item quantity
      :amount        => @shopping_cart.total,   # item value
      :custom_fields => {
        CARTBORDERCOLOR: "C00000",
        LOGOIMG: "https://example.com/logo.png"
      }
    )
    response = request.setup(
      payment_request,
      'https://esteem-wojzag-2.c9.io/payment/success',
      'https://esteem-wojzag-2.c9.io/payment/cancel',
      paypal_options  # Optional
    )
    current_purchase = Purchase.create(user: User.find_by(id: current_user.id), status: 0)
    @current_items.each do |i|
      for k in 0..i.quantity-1 do
        gamekey = Gamekey.find_by(price_platform_game: i.item, user: nil)
        #binding.pry
        #gamekey.user = User.find_by(id: current_user.id) # pending, by user przypadkiem nie dostał klucza nim skończy zakup
        #gamekey.save!
        SoldProduct.create(purchase: current_purchase, gamekey: gamekey, vat: Vat.find(Rails.application.config.current_vat_id), price: i.item.price)
      end
    end
    redirect_to response.redirect_uri
  end
  
  def return_page
  end
  
  def success
    request = Paypal::Express::Request.new(
      :username   => "esteembusiness_api1.gmail.com",
      :password   => "YFAHKSWRLTMQNBMZ",
      :signature  => "AFcWxV21C7fd0v3bYYYRCpSSRl31AUiHnZsA0bO2uIzZNs2hOTDwdWM7"
    )
     payment_request = Paypal::Payment::Request.new(
      :currency_code => "PLN",   # if nil, PayPal use USD as default
      :description   => "Klucze do gier",    # item description
      :quantity      => 1,      # item quantity
      :amount        => @shopping_cart.total,   # item value
      :custom_fields => {
        CARTBORDERCOLOR: "C00000",
        LOGOIMG: "https://example.com/logo.png"
      }
    )
    response = request.checkout!(
      params[:token],
      params[:PayerID],
      payment_request
    )
    if response.ack == "Success"
      current_purchase = Purchase.find_by(user: User.find_by(id: current_user.id), status: 0)
      products = SoldProduct.where(purchase: current_purchase)
      products.each do |p|
        p.gamekey.user = User.find(current_user.id)
        p.gamekey.save!
      end
      current_purchase.status = 1
      current_purchase.save!
    end
    @payment_info = response.payment_info
    
  end
  
  def cancel
    pending_products = SoldProduct.where(purchase: current_purchase)
    pending_products.each do |s|
      s.destroy!
    end
    current_purchase.destroy!
  end
end
