RailsApp::Application.routes.draw do
 

  devise_for :brokers

resources :agreements do

	resources :pos
end

resources :vendors do
	 resources :items do
	 end
end

resources :brokers

resources :customers do

	resources :departments
end
 post 'vendors/jqedit' => 'vendors#jqedit'
 post 'customers/jqedit' => 'customers#jqedit'
 post 'agreements/jqedit' => 'agreements#jqedit'
 post 'customers/:customer_id/departments/jqedit' => 'departments#jqedit'
 post 'vendors/:vendor_id/items/jqedit' => 'items#jqedit'
 post 'agreements/:agreement_id/pos/jqedit' => 'pos#jqedit'

 get 'cus_departments' => 'agreements#cus_departments'

  get 'ven_items' => 'agreements#ven_items'

  get 'new' => 'home#new'

  get 'characters_in_movie' => 'home#characters_in_movie'
  
  root :to => 'home#index'

end
