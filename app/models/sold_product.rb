class SoldProduct < ActiveRecord::Base
    has_one :gamekey
    belongs_to :purchases
    belongs_to :vat
end
