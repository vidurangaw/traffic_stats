Rails.application.routes.draw do
	root to: 'surveys#index'

  	resources :surveys do
  		collection do
  			get :export
  		end
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
