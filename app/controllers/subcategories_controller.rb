class SubcategoriesController < ApplicationController
	before_filter :authenticate_user!
    def create
		Category.find(params[:category_id]).subcategories.create(params[:subcategory])
		redirect_to "/produtos"
	end
	def destroy
		Subcategory.find(params[:id]).destroy
		render nothing: true
	end
end
