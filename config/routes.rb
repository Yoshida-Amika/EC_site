Rails.application.routes.draw do

  root to: "public/homes#index"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}


  scope module: :public do

   patch 'customers/withdrawl' => 'customers#withdrawl', as: 'withdrawl'


    get 'customers/my_page' => 'customers#show'
    resources :customers, only: [:edit, :update] do
      member do
        get "check"
        patch "withdrawl"
      end
    end

    get 'about' => 'homes#about'
    get 'confirmation' => 'customers#confirmation'


    resources :sessions
    resources :items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items

    resources :orders
    get 'thanks' => 'orders#thanks'
    post 'confirm' => 'orders#confirm'


  end

  namespace :admin do
    get '' => 'homes#top'
    resources :customers
    resources :homes
    resources :orders
    resources :items



  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
