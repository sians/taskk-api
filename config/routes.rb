Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    post 'sign_in', to: 'sessions#create'
    delete 'sign_out', to: 'sessions#destroy'
  end

  resources :panels, only: [:index]
  resources :tasks, only: [:create, :update, :destroy]

end
