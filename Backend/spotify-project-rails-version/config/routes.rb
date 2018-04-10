Rails.application.routes.draw do
  get 'artists/index'

  get 'artists/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/artists', to: 'artists#index'
 get '/artists/:id', to:'artists#show', as: 'artist'
end
