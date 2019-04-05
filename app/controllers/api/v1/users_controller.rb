class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
   render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      # if someone tries to get access to the id they would need a jwt signature to the domain and the secret
      @token = JWT.encode({ user_id: @user.id }, "secret")
      render json: { user: @user.username, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    # byebug
    params.require(:user).permit(:name, :email, :password, :birthday)
  end

end
