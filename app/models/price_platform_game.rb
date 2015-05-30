class PricePlatformGame < ActiveRecord::Base
    has_many :gamekeys
    belongs_to :platform
    belongs_to :game
    
    validates_numericality_of :price, :greater_than_or_equal_to => 0
    
    def custom_label_method
        unless self.game.nil? then
            return "#{self.game.name} (#{self.platform.name})"
        end
        return ""
    end
  
    rails_admin do
        label "PPG"
        label_plural "PPGi"
        object_label_method  :custom_label_method
        
        field :game do
            label "Gra"
            required true
        end
        field :platform do
            label "Platforma"
            required true
        end
        field :price do
            label "Cena"
            required true
        end

    end
end
