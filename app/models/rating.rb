class Rating < ApplicationRecord

    validates :rating, numericality: { in: 1..5 }, presence: true
    validates :book_id, presence: true

    belongs_to :user
    belongs_to :book

end
