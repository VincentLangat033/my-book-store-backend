class RatingsController < ApplicationController

    def index
        ratings = Rating.all
        render json: RatingSerializer.new(ratings)
    end

    def show
        rating = Rating.find_by(id: params[:id])
        render json: RatingSerializer.new(rating)
    end

    def my_ratings
        ratings = @current_user.ratings.all
        render json: RatingSerializer.new(ratings)
    end

    def create
        ratingexists = @current_user.ratings.find_by(book_id: params[:book_id])
        if ratingexists
            render json: RatingSerializer.new(ratingexists)
        elsif
            rating = @current_user.ratings.create!(rating_params)
            render json: RatingSerializer.new(rating)
        else
            render json: { error: rating.error.full_messages }, status: :unprocessable_entity
        end

    end

    def update
        rating = @current_user.ratings.find_by(id: params[:id])
        # if rating
            rating.update!(rating_params)
            render json: RatingSerializer.new(rating)
        # else
        #     render json: { error: rating.error.full_messages }, status: :unprocessable_entity
        # end
    end

    def destroy
        rating = Rating.find_by(id: params[:id])
        rating.destroy
        head :no_content
    end

    private

    def rating_params
        params.permit( :id, :book_id, :rating)
    end

end
