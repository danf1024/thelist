Rails.application.routes.draw do
  root to: 'app/welcome#index'

  namespace :app do
    get 'welcome', to: 'welcome#index'

    resources :invitations
    resources :guests
  end
end
