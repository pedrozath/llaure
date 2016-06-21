class Post < ApplicationRecord
    belongs_to :photo
    before_save   :create_slug
    before_update :create_slug

    def create_slug
        self.slug = title.parameterize
    end

    def to_param
        slug
    end

end