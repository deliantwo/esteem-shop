class SoldProduct < ActiveRecord::Base
    has_one :gamekey
    belongs_to :transactions
    belongs_to :vat
end
