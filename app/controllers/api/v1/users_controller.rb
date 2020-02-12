class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = User.all
    render json: @users.as_json(:only => [ :email, :firstname, :lastname ])
  end
  
  def show
    render json: @user.as_json(:only => [ :email, :firstname, :lastname ])
  end
  
  def create
    @user = User.create(user_params)
    if @user.id
      session[:user_id] = @user.id
      render json: {
        id: @user.id,
        name: @user.firstname,
        email: @user.email
      }, status: :created
    else
      render json: {
      }, status: 401
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def set_user
    @user = User.find(params[:id])
  end

  
  # def login
  #   user = User.find_by(email: params['user']['email'])
  #   isAuthed = user.try(:authenticate, params['user']['password'])
    
  #   if !user
  #     render json: {
  #       key: 'email',
  #       message: 'No user can be found with that Email'
  #       }, status: :forbidden
  #     elsif !isAuthed
  #       render json: {
  #         key: 'password',
  #         message: 'Incorrect Password'
  #         }, status: :forbidden
  #     else
  #       session[:user_id] = user.id
  #       render json: {
  #         id: user.id,
  #         email: user.email,
  #         session: session
  #       }
  #   end
  # end

      private
      def user_params
        params.require('user').permit(:email, :firstname, :lastname, :password, :password_confirmation)
      end
end
