Rails.application.routes.draw do
  # resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :qiita_items, only: %i(index)
end
