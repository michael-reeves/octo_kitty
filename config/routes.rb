Rails.application.routes.draw do
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'

  # You can have the root of your site routed with "root"
  root 'static_pages#show'
end
