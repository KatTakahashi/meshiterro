Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
      #単数形resourceの場合、そのコントローラのidがリクエストに含まれなくなる。
      #「いいね」の詳細ページは作成しないので、idの受け渡し不要。
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
