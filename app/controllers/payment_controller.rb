class PaymentController < ApplicationController
  def index
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
      :currency_code => nil,   # if nil, PayPal use USD as default
      :description   => "Example description",    # item description
      :quantity      => 1,      # item quantity
      :amount        => 10,   # item value
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
      :currency_code => nil,   # if nil, PayPal use USD as default
      :description   => "Example description",    # item description
      :quantity      => 1,      # item quantity
      :amount        => 10,   # item value
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
    response.payment_info
  end
  
  def cancel
  end
end
