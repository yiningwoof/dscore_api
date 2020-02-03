class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern 
  
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    # byebug
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render json: {
        logged_in: true,
        user: @user
      }, status: :created
      #  redirect_to attractions_path
    else
      render json: {status: 401}
      #  redirect_to '/login'
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
<<<<<<< HEAD
=======
    end
>>>>>>> 540555696a554e6872793ba2e16be70b5270b58c
  end

  def logout
    reset_session
    render json: {status: 200, logged_out: true}
<<<<<<< HEAD
=======
  end
>>>>>>> 540555696a554e6872793ba2e16be70b5270b58c

  def destroy
    # byebug
    session.delete :user_id
    session[:user_id] = nil
    # redirect_to '/welcome'
  end

end
