Rails.application.routes.draw do

  resources :articles do
  	resources :comments
  end

  get 'gifs/gif_search'

  root 'welcome#index'
end
