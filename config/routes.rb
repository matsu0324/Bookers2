Rails.application.routes.draw do
  # open_mailerルート
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get "/search" => 'search#search'
  devise_for :users
  # チャット機能
  get 'chat/:id' => 'chats#show', as: "chat"
  resources :chats, only: [:create]
  
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end