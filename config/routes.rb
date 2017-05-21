Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
  	collection do
  		get :order
  		get :acceptance
  		get :qualitycheck
  		get :placement
  		get :assembly
  		get :shipping
  		get :returntosupplier
  	end
  end
  resources :suppliers, :customers
  root 'welcome#index'
end
