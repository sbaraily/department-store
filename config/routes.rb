Rails.application.routes.draw do
  root 'departments#index'
  resources :departments do
    resources :items, only: [:index, :new, :create, :destroy]
  end
end
