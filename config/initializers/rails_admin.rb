require 'i18n'
require Rails.root.join('lib', 'rails_admin_add_keys.rb')

I18n.enforce_available_locales = false
I18n.default_locale = :pl

RailsAdmin.config do |config|
  
  # app name
  config.main_app_name = ["eSteem", "Admin Panel"]
  
  # Devise
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.authorize_with do
    redirect_to main_app.root_path unless warden.user.is_admin?
  end
  
  config.excluded_models = ["ShoppingCart", "ShoppingCartItem"]

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["Platform"]
    end
    export
    
    add_keys
    
    bulk_delete
    show 
    edit do
      except ["Platform"]
    end
    delete do
      except ["Platform"]
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
end
