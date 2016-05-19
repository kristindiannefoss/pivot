Rails.application.routes.draw do

  root to: "pages#splash"

  resources :charges
  resource :cart, only: [:create, :show, :destroy, :update]

  delete "/donations/:id", to: "donations#destroy", as: :donations
  patch "/donations/:id", to: "donations#change"

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
  get "/profile/edit-donor", to: "users#edit_donor", as: :edit_donor
  get "/profile/edit-recipient", to: "users#edit_recipient", as: :edit_recipient
  patch "/edit-profile", to: "users#update"

  get "/:username", to: "users#recipient", as: :recipient
  patch "/:username/needs/:slug", to: "donations#update", as: :donate_user_need

  delete "/admin/need_types/:id", to: "admin/need_types#destroy", as: "admin/need_type/delete"

  delete "/admin/users/:id", to: "admin/users#destroy", as: "admin/user/delete"

  delete "/admin/needs/:id", to: "admin/need#destroy", as: "admin/need/delete"

  get "/admin/recipients/:username/needs", to: "admin/needs#index", as: :admin_recipient_needs
  post "/admin/recipients/:username/needs", to: "admin/needs#create"
  delete "/admin/recipients/:username/needs", to: "admin/needs#destroy"
  patch "/admin/recipients/:username/needs", to: "admin/needs#update"

  namespace "admin" do
    get "/recipients", to: "recipients#index"
    get "/recipients/:username", to: "recipients#show", as: :recipient
    resources :need_types
    resources :users
  end

  get "/admin/profile", to: "admin/users#show"
  get "/admin/profile/:id", to: "admin/profiles#show", as: "admin/profile/show"

  get "/*page", to: "errors#not_found"
end
