Rails.application.routes.draw do

  resources :ips

  get 'inform/new'

  root 'home#index'
  match '/editor', to: 'home#editor', via: 'get'
  devise_for :admin_users, controllers: { sessions: "sessions" }

  resources :admin_companies
  resources :companies, :except => [:new, :destroy, :create]
  resources :admins, controller: 'admin_users'
  resources :informs
  resources :plugins, :only => [:index, :create, :destroy]
  resources :logs, :only => [:index]
  # resources :admin_infos, :only => [:show, :edit, :update]
  get '/admin_infos/:id', to: 'admin_infos#show'
  get '/admin_infos/:id/edit', to: 'admin_infos#edit'
  get '/admin_infos/:id/password', to: 'admin_infos#password'
  patch 'admin_infos/:id/edit', to: 'admin_infos#update'
  patch '/admin_infos/:id/password', to: 'admin_infos#update_password'

  resources :products  do
    post 'destroy_ids', on: :collection
  end

  resources :informs  do
    post 'destroy_ids', on: :collection
  end

  resources :push_messages, :except => [:edit]
  resources :pads
  
  mount API::Root => '/'

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
