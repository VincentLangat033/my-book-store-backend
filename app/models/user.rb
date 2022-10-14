class User < ApplicationRecord
    
    has_secure_password

    validates :username, uniqueness: true, presence: true, length: {in: 4..25}
    validates :email, uniqueness: true, presence: true,format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 6..250}
    
    #alias has_many connections
    has_many :bookshelves
    has_many :comments
    has_many :ratings
    has_many :commented_books, through: :comments, source: :book
    has_many :shelved_books, through: :bookshelves, source: :book
    has_many :rated_books, through: :ratings, source: :book


end
