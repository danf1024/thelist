Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'welcome', to: 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  resources :invitations do
    resources :guests, only: [:new, :create], controller: 'invitations/guests'
  end

  resources :guests
  resources :invitation_imports
  resources :tables

  namespace :api do
    resources :invitations, only: :show, param: :rsvp_code
    resources :rsvps, only: :create
  end
end
