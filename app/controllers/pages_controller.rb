class PagesController < ApplicationController
	def index
		@content_class = "full"
		@logo = "logo-cia-das-capas-negativo.png"
		@photos = Photo.all.shuffle.slice(0...3)
	end
end
