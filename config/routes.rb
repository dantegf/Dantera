Rails.application.routes.draw do
  get 'items/index'

  get 'items/show'

  get 'items/new'

  get 'items/create'

  get 'items/update'

  get 'items/edit'

  get 'items/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  match '/contacts',     to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
