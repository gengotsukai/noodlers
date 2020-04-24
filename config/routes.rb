Rails.application.routes.draw do
  devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}

  devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
 	}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ユーザー側のルーティング
  namespace :user do
    root to: 'users#top' #トップ画面
    get 'about' => 'users#about' #アバウトページ
    resources :users, only: [:index, :show, :edit, :update]
    resources :relationships, only: [:create, :destroy]
    resources :genres, only: [:index, :show, :edit, :update, :create, :destroy]
    resources :user_genres, only: [:create, :destroy]
    resources :shops do
    	resource :shop_likes, only: [:create, :destroy]
    	resource :shop_comments, only: [:create, :destroy]
    end
  end

  # 管理者側のルーティング
  namespace :admin do
    get 'admins/top' => 'admins#top' #管理者トップページ
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :shops do
    	resource :shop_comments, only: [:create, :destroy]
    end
  end
end

