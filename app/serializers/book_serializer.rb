class BookSerializer
  include JSONAPI::Serializer
  attributes :id, :image_url, :author, :title, :synopsis, :genre, :ratings 

  attribute :ratings do |object|
    RatingSerializer.new(object.ratings)
  end

end
