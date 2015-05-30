class Purchase < ActiveRecord::Base
    has_many :sold_products, :dependent => :destroy
    belongs_to :user
    
    def custom_label_method
        "Zamówienie ##{self.id}"
    end
    
    rails_admin do
        label "Zamówienie"
        label_plural "Zamówienia"
        object_label_method  :custom_label_method
        
        field :user do
            label "Użytkownik"
            required true
        end
        field :status, :enum do
            enum do
                [["W realizacji", 0], ["Zrealizowano", 1]]
            end
            pretty_value do
                bindings[:object].status == 0 ? "W realizacji" : "Zrealizowano"
            end
            required true
        end
        field :sold_products do
            label "Produkty"
            required true
        end
        
        field :created_at do
            label "Data zamówienia"
            required true
        end
    end
end
