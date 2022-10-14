class Bookshelf < ApplicationRecord
    include Rails.application.routes.url_helpers
    belongs_to :user
    belongs_to :book

    has_one_attached :pref_cover_image

    def image_url
        url_for(self.pref_cover_image)
    end
    
end
