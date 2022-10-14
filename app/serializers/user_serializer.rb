class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :username, :email, :bookshelves

  
  attribute :bookshelves do |object|
    BookshelfSerializer.new(object.bookshelves)
  end
  
end
