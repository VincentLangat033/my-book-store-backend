class BookshelfSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :book_id, :book, :read, :owned, :ownership_source, :preferred_cover_image # , :pref_cover_image_format

  attribute :book do |object|
    BookSerializer.new(object.book)
  end
  
  def pref_cover_image_format
    return unless object.pref_cover_image.attached?
    object.pref_cover_image.blob.attributes
          .slice("filename")
          .merge(url: object.image_url)
          .tap { |attrs| attrs["name"] = attrs.delete("filename")}
  end

end
