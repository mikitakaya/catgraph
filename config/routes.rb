Rails.application.routes.draw do

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
  end

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
