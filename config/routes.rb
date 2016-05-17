Rails.application.routes.draw do

#
# Module 3 requires you to know URLs, paths and HTTP verbs inside and out. Rewrite the routes file for your Little Shop to use only methods that map directly to HTTP verbs: get, post, put, patch and delete. You will probably need to add to: and as: parameters to make sure your apps continue to work, and tests continue to pass.

  root to: "pages#splash"

  resource :cart, only: [:create, :show, :destroy, :update]

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: :logout

  get "/needs", to: "needs#index"
  post "/needs", to: "needs#create"
  get "/needs/:slug", to: "needs#show", as: :need
  delete "/profile", to: "needs#destroy", as: :destroy_need
  patch "/profile", to: "needs#update", as: :edit_need

  get "/recipients", to: "users#index", as: :users
  post "/recipients", to: "users#create"

  get "/profile", to: "users#show", as: :user

  get "/:username", to: "users#recipient", as: :recipient
  patch "/:username/needs/:slug", to: "donations#update", as: :donate_user_need

  # get "/admin/need_types", to: "admin/need_types#index"
  # post "/admin/need_types", to: "admin/need_types#create"
  # get "/admin/need_types/new", to: "admin/need_types#new"
  # get "/admin/need_types/:id/edit", to: "admin/need_types#edit", as: "admin/need"
  # get "/admin/need_types/:id", to: "admin/need_types#show"
  # patch "/admin/need_types/:id", to: "admin/need_types#update"
  # put "/admin/need_types/:id", to: "admin/need_types#update"
  delete "/admin/need_types/:id", to: "admin/need_types#destroy", as: "admin/need_type/delete"

  delete "/admin/users/:id", to: "admin/users#destroy", as: "admin/user/delete"

  delete "/admin/needs/:id", to: "admin/need#destroy", as: "admin/need/delete"

  namespace "admin" do
    resources :need_types
    resources :needs
    resources :users
  end

  get "/admin/profile", to: "admin/users#show"
  get "/admin/profile/:id", to: "admin/profiles#show", as: "admin/profile/show"

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
  #
  # get "admin/users/:id", to: "admin/users#show", as: "admin_user"
  #
  # get "/donation", to: "donations#show"
  # get "/dashboard", to: "users#show"
  # get "/cart", to: "cart_items#index"

  # resources :needs, only: [:index]
end
