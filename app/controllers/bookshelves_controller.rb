class BookshelvesController < ApplicationController

    #to have full CRUD methods
    def index
        shelves = @current_user.bookshelves.all
            render json: shelves
    end

    def show
        shelf = Bookshelf.find_by(id: params[:id])
        render json: shelf
    end

    def create
        shelf = Bookshelf.create!(shelf_params)
        render json: shelf, status: :created
    end

    def update 
        shelf = Bookshelf.find_by(id: params[:id])
        shelf.update(shelf_params)
        render json: BookshelfSerializer.new(shelf)
    end

    def destroy
        shelf = Bookshelf.find_by(id: params[:id])
        shelf.destroy
        head :no_content
    end

    private

    def shelf_params
        #to edit down dependent on prefered create route, preferred cover image being moved to Active Storage
        params.permit(:id, :user_id, :book_id, :read, :owned, :ownership_source, :preferred_cover_image) 
    end
end
