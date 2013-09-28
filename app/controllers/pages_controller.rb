class PagesController < ApplicationController
	def index
		@content_class = "full"
		@logo = "logo-cia-das-capas-negativo.png"
		@photos = Photo.find [1, 2, 3]
	end
end
