class Api::V1::RoundsController < ApplicationController
  before_action :set_round, only: [:show, :update, :destroy]
  def index
    @rounds = Round.all
    render json: @rounds
  end
  def show
    render json: @round
  end
  def create
    @round = Round.create(round_params)
    if session[:game]
      session[:rounds]["#{@round.id}"] = @round
    end
    # byebug
    render json: @round
  end
  def update
    if @round.update(round_params)
      render json: @round
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @round.destroy
  end
  def set_round
    @round = Round.find(params[:id])
  end
  def round_params()
    params.require(:round).permit(:user_id, :game_id, :name)
  end
end
