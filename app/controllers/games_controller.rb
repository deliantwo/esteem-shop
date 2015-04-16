class GamesController < ApplicationController
  def index
  end
  def show
    if id = params[:id]
      @game = Game.find(id)
    end
  end
end
