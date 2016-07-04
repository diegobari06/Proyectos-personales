Rails.application.routes.draw do

  resources :categories
get 'articles/myArticles', to: 'articles#myArticles'  , as: :myArticles
resources :articles do
  resources :omments, only: [:create, :update, :destroy, :show]
end
  devise_for :users
  root 'welcome#index'

  get "/dashboard", to: "welcome#dashboard"

  put "/articles/:id/publish", to: "articles#publish"



end
