Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  resources :users, only: [:show]

  devise_for :users
  root 'welcome#index'
end
