# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :posts, except: :show
    resources :photos, only: :create
  end
end
