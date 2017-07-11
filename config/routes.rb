Rails.application.routes.draw do
  get 'likes/index'

  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  devise_for :users
  
  resources :users
  
  resources :topics do
    resources :bookmarks
  end

  root 'welcome#index'
  
  post :incoming, to: 'incoming#create'
end

