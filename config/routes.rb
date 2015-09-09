Rails.application.routes.draw do
  get '/auth/github/callback', to: 'sessions#create'

  # You can have the root of your site routed with "root"
  root 'static_pages#show'
end
