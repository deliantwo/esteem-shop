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
  
end
