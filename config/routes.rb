Minus::Application.routes.draw do

  get "admin" => 'admin#index'
  
  #payment
  match "payment" => "payment#index"
  match "payerror" => "payment#error"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :links
  resources :posts
  resources :catalogs
  
  get "/store/sold"
  get "/store/unsold"
  
  match "/news" => "news#index"
  match "news/:id" => "news#show"
  
  match "/stocks" => "stock#index"
  match "stocks/:id" => "stock#show"
  
  match "/stuff" => "stuff#index"
  match "stuff/:id" => "stuff#show"
  
  match '/store' => "store#index"
  match "/pay" => "store#pay"
  match "paymessage" => "store#create"
  
  match '/contacts' => "pages#contacts"
  match "/about" => "pages#about"
  match 'store/:id' => 'store#show'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "pages#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  #404
  match '*a' => 'errors#routing'
end
