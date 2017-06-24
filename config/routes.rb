Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  
  resources :topics do
    resources :bookmarks
  end

  root 'welcome#index'
end
