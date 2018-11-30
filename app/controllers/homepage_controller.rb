class HomepageController < ApplicationController
  def home
    @products = Game.all.shuffle.sample(10)
    @products = @products.map do |u|
      { :id => u.id, :name => u.name, :description => u.description, :category => u.category.name, :producer => u.producer.name, :publisher => u.publisher.name, :image_url => u.image_url }
    end
    @categories = Category.all
    @categories = @categories.map do |u|
      { :name => u.name }
    end
  end
  
  def search
    games = Game.all
    if name = params[:name]
      games = games.where('lower(name) LIKE ?', "%#{name}%")
    end
    if cat = params[:category]
      games = games.where(category: Category.find_by(name: cat))
    end
    games = games.map do |u|
      price = 0
      ppgs = PricePlatformGame.where(game: Game.find_by(name: u.name))
      ppgs.each do |p|
        if price < p.price
          price = p.price
        end
      end
      { :id => u.id, :name => u.name, :description => u.description, :category => u.category.name, :producer => u.producer.name, :publisher => u.publisher.name, :image_url => u.image_url, :price => price }
    end
    render json: games, status: :ok
  end
  
  def update_cart
    if id = params[:ppg] and params[:shopping_cart_token] == session[:cart_token]
      shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
      ppg = PricePlatformGame.find(id)
      
      gamekey = Gamekey.find_by(price_platform_game: ppg, user: nil)
      unless gamekey
        render json: {status: "no_keys"}, status: 200
        return
      end
      
      if shopping_cart.remove(ppg)
        while k = shopping_cart.remove(ppg)
        end
        render json: {status: "removed"}, status: 200
      else
        shopping_cart.add(ppg, ppg.price)
        render json: {status: "added"}, status: :ok
      end
    else
      render json: {status: "error"}, status: 200
    end
  end
  
  def cart_status
    if id = params[:ppg] and params[:shopping_cart_token] == session[:cart_token]
      shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
      ppg = PricePlatformGame.find(id)


      gamekey = Gamekey.find_by(price_platform_game: ppg, user: nil)
      unless gamekey
        render json: {status: "no_keys"}, status: 200
        return
      end


      if shopping_cart.remove(ppg)
        shopping_cart.add(ppg, ppg.price)
        render json: {status: "in_cart"}, status: :ok
      else
        render json: {status: "not_in_cart"}, status: 200
      end
    else
      render json: {status: "error"}, status: 200
    end
  end
  
  def cart_content
    json = {}
    if id = params[:shopping_cart_id] and params[:shopping_cart_token] == session[:cart_token]
      shopping_cart = ShoppingCart.find_by(id: id)
      shopping_cart.shopping_cart_items.each do |d|
        unless json[d.item.game.id]
          json[d.item.game.id] = d.item.game.name + " - " + d.item.platform.name
        else
          json[d.item.game.id] = json[d.item.game.id] + ", " + d.item.platform.name
        end
      end
      if json == {}
        render json: {status: "empty"}, status: 200
      else
        render json: json, status: :ok
      end
    else
      render json: {status: "error"}, status: 200
    end
  end
  
  def detail_cart_content
    json = {}
    iterator = 1
    if id = params[:shopping_cart_id] and params[:shopping_cart_token] == session[:cart_token]
      shopping_cart = ShoppingCart.find_by(id: id)
      shopping_cart.shopping_cart_items.each do |d|
        price = d.item.price + (d.item.price * @vat)
        json[iterator] = { id: d.item.game.id, name: d.item.game.name, platform: d.item.platform, price: price, quantity: d.quantity }
        iterator += 1
      end
      if json == {}
        render json: {status: "empty"}, status: 200
      else
        render json: json, status: :ok
      end
    else
      render json: {status: "error"}, status: 200
    end
  end
  
  def change_quantity
    if params[:quantity] == ""
      render json: {status: "error"}, status: 200
      return
    end
    quantity = params[:quantity].to_i
    item_id = params[:item_id].to_i
    if quantity < 0
      render json: {status: "error"}, status: 200
    
    elsif id = params[:shopping_cart_id] and params[:shopping_cart_token] == session[:cart_token]
      shopping_cart = ShoppingCart.find_by(id: id)
      shopping_cart.shopping_cart_items[item_id].quantity = quantity
      shopping_cart.shopping_cart_items[item_id].save
      if quantity == 0
        shopping_cart.shopping_cart_items[item_id].destroy!
      end
      render json: {status: "success"}, status: :ok
    else
      render json: {status: "error"}, status: 200
    end
  end
  
  def cart_total
    if id = params[:shopping_cart_id] and params[:shopping_cart_token] == session[:cart_token]
      shopping_cart = ShoppingCart.find_by(id: id)
      total = shopping_cart.total
      render json: {total: total}, status: :ok
    else
      render json: {status: "error"}, status: 200
    end
  end
end
