Rails.application.routes.draw do
  get 'archives/index'
  get 'archive/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries
  root to: "entries#index"
end
