class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :gamekeys
  has_many :purchases
  
  def custom_label_method
      "#{self.email}"
  end
  
  rails_admin do
    object_label_method  :custom_label_method
    label "Użytkownik"
    label_plural "Użytkownicy"
    
    field :id
    field :email
    field :last_sign_in_at do
      label "Data ostatniego logowania"
    end
  end
end
