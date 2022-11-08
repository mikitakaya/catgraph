Rails.application.routes.draw do

  # 検索機能
  get '/search', to: 'searches#search'

  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # ユーザー用
  scope module: :public do
    # public/homes
    root to: "homes#top"
    get 'about' => "homes#about", as: "about"

    # public/users
    resources :users, only: [:show, :edit, :update]
    get 'users/unsubscribe' => "users#unsubscribe", as: "unsubscribe"
    patch 'users/withdraw' => "users#withdraw", as: "withdraw"

    # public/post_images
    resources :post_images

    # public/favorites
    resources :favorites, only: [:index, :create, :destroy]

    # public/post_comments
    resources :post_comments, only: [:create, :destroy]

    # public/relationships
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # 管理者用
  namespace :admin do
    # admin/homes
    get '/' => "homes#top", as: "top"

    # admin/users
    resources :users, only: [:index, :show, :edit, :update]

    # admin/post_images
    resources :post_images, only: [:index, :show, :destroy]

    # admin/post_comments
    resources :post_comments, only: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
