class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :gamekeys
  has_many :purchases
  
  def active_for_authentication?
    super && !self.blocked? && !self.deleted?
  end
  
  def custom_label_method
      "#{self.email}"
  end
  
  rails_admin do
    object_label_method  :custom_label_method
    label "Użytkownik"
    label_plural "Użytkownicy"
    
    field :email
    field :last_sign_in_at do
      label "Data ostatniego logowania"
    end
    field :blocked do
      label "Zablokowany?"
    end
    field :deleted do
      label "Usunięty?"
    end
  end
end
