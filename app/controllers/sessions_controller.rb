class SessionsController < ApplicationController
    skip_before_action :authorized!, only: [:create]


    def create
        user = User.find_by(username: params[:username])
        ##authenticate user credentials
        if user&.authenticate(params[:password])
            #set session and redirect on success
            
            session[:user_id] = user.id
            render json: UserSerializer.new(user), status: :accepted
        else
            
            render json: {error: "Invalid username or password"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

        

end
