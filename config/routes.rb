Rails.application.routes.draw do

  get 'payment/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'games/show'

  devise_for :users, skip: :registrations
  resources :games
  root to: "homepage#home" # for devise purposes, can be changed later
  
  
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end
  
  get '/search' => 'homepage#search', as: :search
  
  get '/update_cart' => 'homepage#update_cart', as: :update_cart
  get '/cart_status' => 'homepage#cart_status', as: :cart_status
  get '/cart_content' => 'homepage#cart_content', as: :cart_content
  get '/change_quantity' => 'homepage#change_quantity', as: :change_quantity
  get '/cart_total' => 'homepage#cart_total', as: :cart_total
  get '/detail_cart_content' => 'homepage#detail_cart_content', as: :detail_cart_content
  get '/cart/checkout' => 'cart#checkout', as: :cart_checkout
  get '/cart/detail_view' => 'cart#detail_view', as: :cart_detail_view
  get '/users/purchases' => 'user#purchases', as: :users_purchases
  get '/users/keys' => 'user#keys', as: :users_keys
  
  get '/payment/test' => 'payment#index', as: :payment_test
  get '/payment/success' => 'payment#success', as: :payment_success
  get '/payment/cancel' => 'payment#cancel', as: :payment_cancel
  get '/payment/no_keys' => 'payment#no_keys', as: :payment_no_keys
  
  get '/about' => 'staticpages#about', as: :static_about
  get '/partnership' => 'staticpages#partnership', as: :static_partnership
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
