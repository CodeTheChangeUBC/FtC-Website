Rails.application.routes.draw do

  # Define the root of the webpage
  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'get-involved' => 'static_pages#get_involved', as: "get_involved"
  get 'events' => 'static_pages#events'
  get 'contact' => 'static_pages#contact'
  get 'events/vow-of-silence' => 'static_pages#vow_of_silence', as: "vow_of_silence"
  get 'events/ee-dance-challenge' => 'static_pages#ee_dance_challenge', as: "ee_dance_challenge"
  get 'events/mini-we-day' => 'static_pages#mini_we_day', as: "mini_we_day"
  
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
