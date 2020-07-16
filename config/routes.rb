Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmation',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }
  
  post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
