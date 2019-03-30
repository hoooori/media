# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

  namespace :admin do
    resources :posts, except: :show
    resources :photos, only: :create
    resources :categories, except: :show
  end

  devise_for :admin_users, path: 'admin', skip: %i[registrations passwords],
                           controllers: { sessions: 'admin_users/sessions' }, path_names: { sign_in: 'login', sign_out: 'logout' }
end
