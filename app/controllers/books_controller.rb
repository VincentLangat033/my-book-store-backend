class BooksController < ApplicationController

    skip_before_action :authorized!, only: [:index, :show]
    # CREATE/VIEW methods only
    # Admin delete/update method? #stretch

    def index
        books = Book.all
        render json: BookSerializer.new(books)
    end

    def show
        book = Book.find_by_title(title: params[:title])
        render json: BookSerializer.new(book)
    end

    def create
        book = Book.where(:author => book_params[:author], :title => book_params[:title]).first_or_create! do |book|
            book.image_url = book_params[:image_url]
            book.synopsis = book_params[:synopsis]
            book.genre = book_params[:genre]
            end
        if book 
            @current_user.bookshelves.where(:book_id => book.id).first_or_create! do |shelf|
                shelf.read = false
                shelf.owned = false
                shelf.ownership_source = "Not yet owned"
                shelf.preferred_cover_image = nil
            end
            render json: BookSerializer.new(book), status: :created
        else
            render json: { error: book.error.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def book_params
        params.permit(:image_url, :author, :title, :synopsis, :genre)
    end


end
