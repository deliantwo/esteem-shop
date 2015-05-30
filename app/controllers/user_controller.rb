class UserController < ApplicationController
  
   before_filter :authenticate_user!,
    :only => [:purchases, :keys]
  
  def purchases
    @user = current_user
    all_purchaces = Purchase.where(user_id: current_user)
    
    @purchases = []
    
    all_purchaces.each do |p|
      sp_list = SoldProduct.where(purchase: p)
      
      sp_to_add = Hash.new
      sp_list.each do |sp|
        gamekey = Gamekey.find(sp.gamekey_id)
        vat = Vat.find(sp.vat_id)
        ppg = PricePlatformGame.find(gamekey.price_platform_game_id)
        platform = Platform.find(ppg.platform_id)
        game = Game.find(ppg.game_id)
        if(sp_to_add[ppg].nil?)
          sp_to_add[ppg] = [1, sp, game, platform, vat]
        else
          sp_to_add[ppg][0] += 1
        end
      end
      @purchases.push([p, sp_to_add])
    end
  end
  
  def keys
    all_keys = Gamekey.where(user: current_user)
    @key_infos = []
    all_keys.each do |key|
      ppg = PricePlatformGame.find(key.price_platform_game_id)
      platform = Platform.find(ppg.platform_id)
      game = Game.find(ppg.game_id)
      
      @key_infos.push([game.name, platform.name, key.content])
    end
  end
end
