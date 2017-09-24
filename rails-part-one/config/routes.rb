Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mirrors do 

	member do 
		get 'activities', to: 'mirrors#activities'
	end

  	resources :members 

  end 

  root 'mirrors#index'
end
