Rails.application.routes.draw do

resources :articles do
      resources :comments
  end 

  root 'articles#index'
  get '/index' => 'articles#index'
  get 'articles/id:' => 'articles#show'
  get 'new'=>'articles#new'
  post 'create' => 'articles#create'
  get 'articles/:id/edit' => 'articles#edit'
  patch 'articles/:id' => 'articles#update'
  delete 'articles/:id' =>'articles#destroy'

  
   resources :users 

  get '/signup' => 'users#new'
  post '/signup' =>'users#create' 
  get '/profile' => 'users#profile'
  get '/edit' => 'users#edit'
  patch '/users/update' => 'users#update'
  get '/manage' => 'users#manage'
  get '/show' => 'users#show'
  get '/editusers/:id'=>'users#editusers', as: :editusers
  patch 'users/:id/updateusers' => 'users#updateusers'
  put   'users/:id/updateusers' => 'users#updateusers'

  resources :sessions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
  









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
