Rails.application.routes.draw do
  
  post 'groups_users' , to: 'groups_users#create'
  delete 'groups_users/destroy/:id' , to: 'groups_users#destroy', as: :remove_user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'
  resources :groups
  get  'users/index',to:"users#index"
  
  devise_for :users, controllers: 
        { sessions: 'users/sessions' ,
          registrations: 'users/registrations',
          passwords: 'users/passwords',
          confirmations: 'users/confirmations',
          omniauth: 'users/omniauth',
          unlocks: 'users/unlocks'
        }
end
