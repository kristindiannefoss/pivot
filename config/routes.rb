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
  # get "/admin/items", to: "admin/items#index"
  # post "/admin/items", to: "admin/items#create"
  # get "/admin/items/new", to: "admin/items#new", as: "new_admin_item"
  # get "/admin/items/:id/edit", to: "admin/items#edit", as: "edit_admin_item"
  # get "/admin/items/:id", to: "admin/items#show", as: "admin_item"
  # patch "/admin/items/:id", to: "admin/items#update"
  # put "/admin/items/:id", to: "admin/items#update"
  # delete "/admin/items/:id", to: "admin/items#destroy"
  #
  # get "admin/users/:id", to: "admin/users#show", as: "admin_user"
  #
  # get "/donation", to: "donations#show"
  # get "/dashboard", to: "users#show"
  # get "/cart", to: "cart_items#index"
  # get "/admin/dashboard", to: "admin/users#show"

  # resources :needs, only: [:index]
end
