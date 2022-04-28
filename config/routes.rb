Rails.application.routes.draw do
  resources :articles
  resources :mypage, only: :show
  root :to => 'articles#index'
  devise_for :users
  get '/mypage', to: 'mypage#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
