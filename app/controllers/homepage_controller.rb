class HomepageController < ApplicationController
  def home
    @products = Game.all.shuffle.sample(10)
    @products = @products.map do |u|
      { :id => u.id, :name => u.name, :description => u.description, :category => u.category.name, :producer => u.producer.name, :publisher => u.publisher.name, :image_url => u.image_url }
    end
  end
  
  def search
    games = Game.all
    if name = params[:name]
      games = games.where('name LIKE ?', "%#{name}%")
    end
    if cat = params[:category]
      games = games.where(category: Category.find_by(name: cat))
    end
    games = games.map do |u|
      { :id => u.id, :name => u.name, :description => u.description, :category => u.category.name, :producer => u.producer.name, :publisher => u.publisher.name, :image_url => u.image_url }
    end
    render json: games, status: 200
  end
  
  def update_cart
    if id = params[:ppg]
      shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
      ppg = PricePlatformGame.find(id)
      if shopping_cart.remove(ppg)
        render json: {status: "removed"}, status: 200
      else
        shopping_cart.add(ppg, ppg.price)
        render json: {status: "added"}, status: 200
      end
    else
      render json: {status: "error"}, status: 200
    end
  end
  
  def cart_status
    if id = params[:ppg]
      shopping_cart = ShoppingCart.find(params[:shopping_cart_id])
      ppg = PricePlatformGame.find(id)
      if shopping_cart.remove(ppg)
        shopping_cart.add(ppg, ppg.price)
        render json: {status: "in_cart"}, status: 200
      else
        render json: {status: "not_in_cart"}, status: 200
      end
    else
      render json: {status: "error"}, status: 200
    end
  end
end
