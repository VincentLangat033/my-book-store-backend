class CommentsController < ApplicationController

    
    def index
        comments = Comment.all
        render json: comments
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment
    end

    def create
        book = Book.find_by(id: params[:id])
        if book
           comment = @current_user.comment.create!(comment_params)
            render json: comment, status: :created
        else
            render json: { error: comment.error.full_messages }, status: :unprocessable_entity
        end
    end

    def update 
        comment = Comment.find_by(id: params[:id])
        comment.update(comment_params)
        render json: comment
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        head :no_content
    end

    private

    def comment_params
        #to edit down dependent on prefered create route
        params.permit(:user_id, :book_id, :comment, :rating) 
    end

end
