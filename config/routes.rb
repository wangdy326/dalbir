RailsApp::Application.routes.draw do
 

  devise_for :brokers

resources :agreements do

	resources :pos

	member do
		post 'pos/jqedit' => 'pos#jqedit'
	end
end

resources :vendors do
	 resources :items do
	 end
	 member do
	 	  post 'items/jqedit' => 'items#jqedit'
	 end
end

resources :brokers

resources :customers do

	resources :departments
	member do
	 	  post 'departments/jqedit' => 'departments#jqedit'
	 end
end
 post 'vendors/jqedit' => 'vendors#jqedit'
 post 'customers/jqedit' => 'customers#jqedit'
 post 'agreements/jqedit' => 'agreements#jqedit'

 get 'cus_departments' => 'agreements#cus_departments'

  get 'ven_items' => 'agreements#ven_items'

  get 'new' => 'home#new'

  get 'characters_in_movie' => 'home#characters_in_movie'
  
  root :to => 'home#index'

end
