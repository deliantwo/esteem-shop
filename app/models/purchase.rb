class Purchase < ActiveRecord::Base
    has_many :sold_products
end
