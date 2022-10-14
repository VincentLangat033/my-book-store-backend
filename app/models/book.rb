class Book < ApplicationRecord
        

    has_many :bookshelves
    has_many :comments
    has_many :ratings
    has_many :user_comments, through: :comments, source: :user
    has_many :user_bookshelves, through: :bookshelves, source: :user
    has_many :user_ratings, through: :ratings, source: :user


end