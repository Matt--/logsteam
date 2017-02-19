Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'notes/editalert'
  resources :notes

  authenticated :user do
  	root 'notes#index', as: "authenticated_root"
  end


  root 'welcome#index'

  get 'calendar' => 'notes#calendar'

  


end
