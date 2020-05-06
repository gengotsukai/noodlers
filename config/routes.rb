Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
 	}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # ウェブサイトのtopページ
  root to: 'homes#top'
  get 'home/about' => 'homes#about'


  # ユーザー側のルーティング
  namespace :user do
    get 'confirm' => 'users#confirm' #退会確認ページ
    get 'shops/search' => 'shops#search'
    get 'users/:id/follows' => 'relationships#follows', as: "follows"
    get 'users/:id/followers' => 'relationships#followers', as: "followers"
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :genres, only: [:index, :show, :edit, :update, :create, :destroy]
    resources :user_genres, only: [:create, :destroy]
    resources :shops do
    	resource :shop_likes, only: [:create, :destroy]
    	resource :shop_comments, only: [:create, :destroy]
    end
  end
end
