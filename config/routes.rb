Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users
  resources :teas
end
