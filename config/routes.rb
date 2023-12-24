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

    resources :customers do
      member do
        get "check"
        patch "withdrawl"
      end
    end

    get 'about' => 'homes#about'
    resources :customers
    resources :sessions
    resources :items
    resources :cart_items
    resources :orders
    get 'thanks' => 'orders#thanks'

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
