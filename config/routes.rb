Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :comments, only:[:index]
      resources :posts, only:[:index]
    end
  end

  mount API::Root => '/'


  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'

  get 'users', to: "users#index"
  get 'users/index'

  post 'follow', to: "relationships#create"
  delete 'unfollow/:user_id', to: "relationships#destroy"

  devise_for :users, :controllers => {
    :sessions => 'users/sessions'
  }


  get 'home/index'
  get 'home/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "posts#index"

  resources :posts do
    resources :comments
    resources :likes, only:[:create], :controller => :post_likes
    delete 'likes', to: 'post_likes#destroy'
  end

  #resources :relationships, only:[:create, :destroy]

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
