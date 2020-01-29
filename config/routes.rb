Rails.application.routes.draw do

  root "home#top"

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get 'profile/:id/regist' => "profile#regist_form" #ユーザープロフィール登録画面へ移動
  post 'profile/:id/regist' => "profile#regist"
  get 'profile/:id/confirm' => "profile#confirm"
  get 'profile/:id/edit' => "profile#edit"
  post 'profile/:id/update' => "profile#update"
  get 'profile/:id' => "profile#show"

  get 'rooms/:id' => "rooms#show"

  get 'company/top' => "company#top"

  get 'signup' => "users#new"
  get 'users/confirm' => "users#confirm"
  get 'users/:id/index' => "users#index"
  post 'users/create' => "users#create"
  post 'users/:id/destroy' => "users#destroy"

  get 'posts/:id/new' => "posts#new"
  post 'posts/:id/create' => "posts#create"
  post 'posts/:id/destroy' => "posts#destroy"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/search' => "posts#search"

  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"

  get '/' => "home#top"
end
