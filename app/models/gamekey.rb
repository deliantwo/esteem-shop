class Gamekey < ActiveRecord::Base
    belongs_to :user
    belongs_to :sold_product
end
