Rails.application.routes.draw do
	# get 'articles/' => 'articles'
	# post 'articles/new' => 'articles#create'
	resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'index' =>'top#index'

end
