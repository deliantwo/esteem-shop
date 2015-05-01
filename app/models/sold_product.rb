class SoldProduct < ActiveRecord::Base
    belongs_to :gamekey
    belongs_to :purchase
    belongs_to :vat
end
