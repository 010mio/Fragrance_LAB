Rails.application.routes.draw do
  #ルートパス
  root to: 'public/homes#top'
  #アバウトパス
  get '/about' => 'public/homes#about', as: "about"
  #検索パス
  get "search" => "public/searches#search"

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

#ゲスト用
devise_scope :customer do
  post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :customers, only: [:index, :show, :destroy]
    resources :articles, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end

  end

  scope module: :public do
    resources :customers, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
    end
    resources :articles, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end
