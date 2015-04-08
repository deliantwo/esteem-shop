class SoldProduct < ActiveRecord::Base
    has_one :gamekey
    belongs_to :transaction
    belongs_to :vat
end
