Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'
  get 'home/data' => 'home#data', as: :home_data
  get 'home/rec' => 'home#rec', as: :home_rec
  get 'home/mail' => 'home#mail', as: :home_mail
  post 'home/submit' => 'home#submit', as: :home_submit
  get 'home/tests' => 'home#tests', as: :home_tests

  get 'ipay/index' => 'ipay#index', as: :ipay_index
  post 'ipay/resp' => 'ipay#resp', as: :ipay_resp
  post 'ipay/bresp' => 'ipay#bresp', as: :ipay_bresp

  get 'admin' => 'admin#index', as: :admin_index
  get 'admin/login' => 'admin#new', as: :admin_login
  get 'google/callback' => 'admin#callback', as: :admin_callback
  get 'admin/logout' => 'admin#destroy', :as => :admin_logout

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
