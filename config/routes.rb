Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'




  root 'welcome#index'
end
