class Category < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	has_many :subcategories
	has_many :photos, through: :subcategories
	# attr_accessible :title
end
