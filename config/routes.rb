Rails.application.routes.draw do
  resources :tasks do
    member do
      patch :toggle
    end
  end
  resources :todos
  resources :quotes
end
