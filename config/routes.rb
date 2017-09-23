Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'welcome', to: 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  resources :invitations
  resources :guests
  resources :invitation_imports
end
