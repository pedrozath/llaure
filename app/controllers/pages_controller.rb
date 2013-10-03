class PagesController < ApplicationController
	def index
		@content_class = "full"
		@logo = "logo-cia-das-capas-negativo.png"
		@photos = ENV["FRONT_PHOTOS_IDS"].split(";").collect(&:to_i)
	end
end
