class GamesController < ApplicationController
  def index
  end
  def show
    p = PricePlatformGame.find(1)
    @shopping_cart.add(p, p.price)
    @testtt = @shopping_cart.total
    if id = params[:id]
      @game = Game.find(id)
      if ppg = PricePlatformGame.find_by(platform: Platform.find_by(name: "Steam"), game: Game.find(id))
        @steam_price = ppg.price + (ppg.price * (Vat.find(Rails.application.config.current_vat_id).value / 100.00))
        @current_steam_ppg = ppg
      else
        @steam_price = "Towar niedostępny"
        @current_steam_ppg = nil
      end
      if ppg = PricePlatformGame.find_by(platform: Platform.find_by(name: "Origin"), game: Game.find(id))
        @origin_price = ppg.price + (ppg.price * (Vat.find(Rails.application.config.current_vat_id).value / 100.00))
        @current_origin_ppg = ppg
      else
        @origin_price = "Towar niedostępny"
        @current_origin_ppg = nil
      end
    end
  end
end
