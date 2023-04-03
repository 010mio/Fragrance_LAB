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
  end

  scope module: :public do
    resources :articles, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  end
end
