class GamesController < ApplicationController
  def index
  end
  def show
    if id = params[:id]
      @game = Game.find(id)
      if ppg = PricePlatformGame.find_by(platform: Platform.find_by(name: "Steam"), game: Game.find(id))
        @steam_price = ppg.price + (ppg.price * (Vat.last.value.to_f / 100.00))
      else
        @steam_price = "Towar niedostępny"
      end
      if ppg = PricePlatformGame.find_by(platform: Platform.find_by(name: "Origin"), game: Game.find(id))
        @origin_price = ppg.price + (ppg.price * (Vat.last.value.to_f / 100.00))
      else
        @origin_price = "Towar niedostępny"
      end
    end
  end
end
