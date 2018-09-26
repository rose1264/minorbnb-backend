class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :index]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    puts "create"
    @user = User.create(user_params)
    puts "create AvatarUploader"
    # @uploader = AvatarUploader.new
    # @uploader.store!(params[:avatar])
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      puts "saved user and avatar"
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    # params.require(:user).permit(:name, :password, :avatar)
    params.permit(:name, :password, :avatar)
  end
end
