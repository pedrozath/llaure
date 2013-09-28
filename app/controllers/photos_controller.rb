class PhotosController < ApplicationController
	def create
		p = Photo.create params[:photo]
		p.image = params["file"]
		p.save
		render text: "tudo certo!"
	end

	def index
		@current_page = "produtos"
		@photos = if params[:subcategory]
			Subcategory.find(params[:subcategory]).photos
		elsif params[:category]
			Category.find(params[:category]).photos
		else
			Photo.all
		end
		request.xhr? ? render(partial: "photo", collection: Photo.all) : render
	end

	def show
		@current_page = "produtos"
		@photo = Photo.find(params[:id])
		@photos = @photo.subcategory.category.photos
		@open_graph_data = [
			{title: "#{@photo.subcategory.category.title} / #{@photo.subcategory.title}"},
			{image: @photo.image_url(:medium)},
			{type: "website"},
			{url: request.url}
		]
	end

	def destroy
		Photo.find(params[:id]).destroy
		render partial: "photo", collection: Photo.all
	end
end