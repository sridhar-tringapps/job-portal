class Api::V1::UsersController < ApplicationController

    def index
      users = User.all
      render json: users, only: [:email], status: 200
    end
  
    def create
      user = User.new(
        id: user_params[:id],
        email: user_params[:email],
        password: user_params[:password]
      )
      if user.save
        render json: user, status: 200
      else
        render json: {error: "Error creating user"}
      end
    end
  
    def show
      @user = User.find_by(id: params[:id])
      if @user
        render json: @user, status: 200
      else
        render json: {error: "User not found"}
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      if @user
        @user.destroy
        render json: { message: 'User deleted sucessfully'},status: 200
      else
        render json: { error: 'Unable to delete'},status: 400
      end
  
    end
  
  
    private
      def user_params
        params.permit([
          :email,
          :password
        ])
      end
  end
  