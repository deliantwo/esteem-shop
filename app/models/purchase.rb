class Purchase < ActiveRecord::Base
    has_many :sold_products
    belongs_to :user
end
