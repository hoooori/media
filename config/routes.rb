Rails.application.routes.draw do
  namespace :admin do
    resources :posts, except: %i[show]
  end
end
