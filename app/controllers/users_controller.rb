class UsersController < ApplicationController
skip_before_action :verify_authenticity_token
skip_before_action :authorized!, only: [:create]
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    

    def create
        user = User.create!(user_params)
        # session[:user_id] = user.id
        # render json: UserSerializer.new(user), status: :created 
        render json: user, status: :created
            rescue ActiveRecord::RecordInvalid => e
              render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
            # else
            #   render json: user.errors.full_messages, status: :unprocessable_entity
            # end
          end
    end

    def show
        render json: UserSerializer.new(@current_user), status: :ok
    end



    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
