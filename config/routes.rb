Rails.application.routes.draw do
  #ルートパス
  root to: 'public/homes#top'
  #アバウトパス
  get '/about' => 'public/homes#about', as: "about"

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

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
    resources :customers, only: [:show, :edit, :update]
    resources :articles, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  end
end
