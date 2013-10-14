Ciadascapas::Application.routes.draw do
	get "/webmail" => redirect("http://mail.google.com/a/capasparasofa.com.br")
	get "questions/index"
	devise_for :users
	get "/admin", to: redirect("/users/sign_in")
	root to: "pages#index"
	get "/produtos" => "photos#index"
	
	resources :questions, path: "duvidas"
	resources :contacts, path: "contato"

	resources :photos, path: "fotos"


	resources :categories, path: "" do
		resources :photos, path: "fotos"
		resources :subcategories, path: "tipos" do
			resources :photos, path: "fotos"
		end
	end

	get "/:action" => "pages"
end