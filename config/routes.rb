Rails.application.routes.draw do

 # 検索機能
 get '/search', to: 'searches#search'

 # ユーザー用
 # URL /users/sign_in ...
 devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  passwords: 'public/passwords',
  sessions: 'public/sessions'
 }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }

 devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  get '/users', to: 'public/registrations#new'
 end

 # ユーザー用
 scope module: :public do
  # public/homes
  root to: "homes#top"
  get 'about' => "homes#about", as: "about"

  # public/users
  resources :users, only: [:show, :edit, :update] do
   # いいね一覧
   collection do
    get :favorites
    get :unsubscribe
    patch :withdraw
   end

   # public/relationships
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end

  # public/post_images
  resources :post_images do
   # public/favorites
   resource :favorites, only: [:create, :destroy]
   # public/post_comments
   resources :post_comments, only: [:create, :destroy]
  end
 end

 # 管理者用
 namespace :admin do
  # admin/homes
  get '/' => "homes#top", as: "top"

  # admin/users
  resources :users, only: [:index, :show, :edit, :update]

  # admin/post_images
  resources :post_images, only: [:show, :destroy] do
   # admin/post_comments
   resources :post_comments, only: [:destroy]
  end
 end

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
