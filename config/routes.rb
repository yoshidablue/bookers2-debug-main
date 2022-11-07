Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"

  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    # resourcesだといいね取り消しの時ルーティングエラーになる。idが付与されるため。
    # resourceだとidが付与されない。
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end