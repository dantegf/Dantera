Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'our_devise/registrations' }
  resources :items do
    member do
      get "print", to: "items#print"
      get "small_print", to: "items#small_print"
      post "mail", to: "items#mail"
    end
  end


  root to: 'pages#home'

  get 'items/code'

  get 'items/show'

  post 'items/report_lost'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  get "/:search", to: "items#show"

  # I (Dante) added this not sure if it's correct, but works /dantera.org/pages/about_us
  get 'pages/how_to'

  get 'pages/about_us'
  # end

  # get 'items/index'

  # get 'items/new'

  # post 'items/create'

  # get 'items/update'

  # get 'items/edit'

  # get 'items/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
