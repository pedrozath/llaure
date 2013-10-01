Ciadascapas::Application.routes.draw do
	get "/webmail" => redirect("http://mail.google.com/a/capasparasofa.com.br")
	get "questions/index"
	devise_for :users
	get "/admin", to: redirect("/users/sign_in")
	root to: "pages#index"
	get "/produto/:id" => "photos#show"
	get "/produtos/:category/(:subcategory)" => "photos#index"
	
	resources :questions, path: "duvidas"
	resources :contacts, path: "contato"
	resources :photos, path: :produtos
	resources :categories do
		resources :subcategories
	end
	get "/:action" => "pages"
end