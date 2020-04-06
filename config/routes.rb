Rails.application.routes.draw do
  resources :orders
  root 'home#index'
  

  post 'groups_users' , to: 'groups_users#create'
  delete 'groups_users/destroy/:id' , to: 'groups_users#destroy', as: :remove_user

  resources :groups
  resources :friends
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
