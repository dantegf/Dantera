Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'our_devise/registrations' }
  resources :items


  root to: 'pages#home'

  post '/items/:id/mail', to: 'items#mail'

  # get 'items/index'

  get 'items/code'

  get 'items/show'

  post 'items/report_lost'

  # get 'items/new'

  # post 'items/create'

  # get 'items/update'

  # get 'items/edit'

  # get 'items/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
