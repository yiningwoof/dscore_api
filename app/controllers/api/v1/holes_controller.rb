class Api::V1::HolesController < ApplicationController
  before_action :set_hole, only: [:show, :update, :destroy]
  def index
    @holes = Hole.all
    render json: @holes
  end
  def show
    render json: @hole
  end
  # def create
  #   @hole = Hole.create(game_params)
  #   render json: @hole
  # end
  def update
    if @hole.update(hole_params)
      render json: @hole
    else
      render json: @hole.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @hole.destroy
  end
  def set_hole
    @hole = Hole.find(params[:id])
  end
  def hole_params()
    params.require(:hole).permit(:lat, :lng, :icon, :pic, :par)
  end
end
