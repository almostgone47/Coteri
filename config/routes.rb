Rails.application.routes.draw do

  root 'home#index'

  # Devise user account related routes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/regisatrations'
  }
  
  # Resource routes (maps HTTP verbs to controller actions automatically)
  resources :users do
    member do
      get :likers, :likees
    end
  end

  resources :relationships, only: [:create, :destroy]

  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user
  # regular route:
  #   get 'products/:id' => 'catalog#view'

  # named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # resource route with options:
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

  # resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
