Rails.application.routes.draw do
  root 'users#show'
  resource :user
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
