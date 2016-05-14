Rails.application.routes.draw do

#
# Module 3 requires you to know URLs, paths and HTTP verbs inside and out. Rewrite the routes file for your Little Shop to use only methods that map directly to HTTP verbs: get, post, put, patch and delete. You will probably need to add to: and as: parameters to make sure your apps continue to work, and tests continue to pass.

  root to: "pages#splash"

  resource :cart, only: [:create, :show, :delete, :update]

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: :logout

  get "/needs", to: "needs#index"
  post "/needs", to: "needs#create"
  get "/needs/:slug", to: "needs#show", as: :need

  get "/recipients", to: "users#index", as: :users
  post "/recipients", to: "users#create"

  get "/profile", to: "users#show", as: :user

  get "/:username", to: "users#recipient", as: :recipient
  patch "/:username/needs/:slug", to: "needs#donate", as: :donate_user_need

  get "/*page", to: "errors#not_found"

  # get "/items", to: "items#index"
  # get "/items/:id", to: "items#show", as: "item"
  #
  # get "/users/new", to: "users#new", as: "new_user"
  # post "/users", to: "users#create", as: "users"
  #
  # post "/cart_items", to: "cart_items#create"
  # patch "/cart_items/:id", to: "cart_items#update", as: "cart_item"
  # put "/cart_items/:id", to: "cart_items#update"
  # delete "/cart_items/:id", to: "cart_items#destroy"
  #
  # get "/donations", to: "donations#index"
  # post "/donations", to: "donations#create"
  #
  get "/admin/needs", to: "admin/needs#index"
  post "/admin/needs", to: "admin/needs#create"
  get "/admin/needs/new", to: "admin/needs#new", as: "new_admin_need"
  get "/admin/needs/:id/edit", to: "admin/needs#edit", as: "edit_admin_need"
  get "/admin/needs/:id", to: "admin/needs#show", as: "admin_need"
  patch "/admin/needs/:id", to: "admin/needs#update"
  put "/admin/needs/:id", to: "admin/needs#update"
  delete "/admin/needs/:id", to: "admin/needs#destroy"

  namespace "admin" do
    resources :needs
    resources :users
  end
  #
  # get "admin/users/:id", to: "admin/users#show", as: "admin_user"
  #
  # get "/donation", to: "donations#show"
  # get "/dashboard", to: "users#show"
  # get "/cart", to: "cart_items#index"
  # get "/admin/dashboard", to: "admin/users#show"

  # resources :needs, only: [:index]
end
