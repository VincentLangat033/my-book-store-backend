class RatingSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :book_id, :rating

end
