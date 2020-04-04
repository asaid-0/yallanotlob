Rails.application.routes.draw do
resources :orders
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get  'users/index',to:"users#index"
  get 'search/groups', to: "orders#searchGroups"
  get 'search/friends', to: "orders#searchFriends"
  devise_for :users, controllers: 
        { sessions: 'users/sessions' ,
          registrations: 'users/registrations',
          passwords: 'users/passwords',
          confirmations: 'users/confirmations',
          omniauth: 'users/omniauth',
          unlocks: 'users/unlocks'
        }
end
