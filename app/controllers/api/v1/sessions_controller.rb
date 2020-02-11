class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern 
  
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    # byebug
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # byebug
    
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
    if @current_user && @current_game && session[:rounds] && session[:scores]
      # byebug
      render json: {
        logged_in: true,
        game: @current_game,
        user: @current_user,
        rounds: session[:rounds],
        scores: session[:scores]
      }
    elsif @current_user && @current_game && session[:rounds]
      render json: {
        logged_in: true,
        game: @current_game,
        user: @current_user,
        rounds: session[:rounds]
      }
    elsif @current_user && @current_game
      render json: {
        logged_in: true,
        game: @current_game,
        user: @current_user
      }
    elsif @current_user && !@current_game
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {status: 200, logged_out: true}
  end

  def destroy
    # byebug
    session.delete :user_id
    session[:user_id] = nil
    # redirect_to '/welcome'
  end

end
