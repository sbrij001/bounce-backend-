class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(email: user_login_params[:email])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { error: @user.errors }, status: :unauthorized
    end
  end

  def show
    jwt = request.headers['Authorization'].split(" ")[1]
    id = JWT.decode(jwt, "my_s3cr3t")[0]["user_id"]
    @user = User.find(id)
    render json: {user: @user}
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:email, :password)
  end
end
