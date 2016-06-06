class PagesController < ApplicationController
	def index
		@content_class = "full"
		@logo = "llaure-logo-branco.png"
		@photos = Photo.find ENV["FRONT_PHOTOS_IDS"].split(";").collect(&:to_i)
	end
end
