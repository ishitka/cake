Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
  end
  
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  
  namespace :admin do
    resources :order_items, only: [:update]
  end
  
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  
  scope module: :public do
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
  end
  
  scope module: :public do
    get '/orders/confirm' => 'orders#confirm', as: 'confirm_order'
    get '/orders/complete' => 'orders#complete', as: 'complete_order'
    resources :orders, only: [:new, :create, :index, :show, :update]
  end
  
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get '/cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  
  scope module: :public do
    resources :items, only: [:index, :show]
  end
  
  scope module: :public do
    get '/customers/confirm' => 'customers#confirm',as: 'confirm_customer'
    patch '/customers/withdraw' => 'customers#withdraw',as:'withdraw_customer'
    resources :customers, only: [:show, :edit, :update]
  end
  
  scope module: :public do
    get '/registations/sign_up' => 'registations#new'
    get '/registations' => 'registations#create'
  end
  
  scope module: :public do
    root to:'homes#top'
    get'/about' => 'homes#about'
  end
  
  namespace :admin do
    get 'admin'=>'homes#top'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
