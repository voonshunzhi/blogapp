Rails.application.routes.draw do
    devise_for :users
    root "articles#index"
    resources :articles do
        resources :comments
    end
    mount ActionCable.server, at: '/cable'
end
