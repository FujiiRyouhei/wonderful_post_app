Rails.application.routes.draw do
  resources :articles
  # resources :mypage, only: :show
  root :to => 'articles#index'
  devise_for :users
  get '/mypage', to: 'mypage#show'
  get '/search_article', to: 'articles#search'
  get '/search_myarticle', to: 'mypage#search'
  # get '/search_myarticle', to: 'mypage#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
