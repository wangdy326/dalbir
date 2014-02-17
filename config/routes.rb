RailsApp::Application.routes.draw do
 

  devise_for :brokers

resources :agreements do

	resources :pos

end

resources :vendors do

	 resources :items

end

resources :brokers

resources :customers do

	resources :departments
end

 get 'cus_departments' => 'agreements#cus_departments'

  get 'ven_items' => 'agreements#ven_items'

  get 'new' => 'home#new'

  get 'characters_in_movie' => 'home#characters_in_movie'
  
  root :to => 'home#index'

end
