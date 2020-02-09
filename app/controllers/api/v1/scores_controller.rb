class Api::V1::ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy]
  def index
    @scores = Score.all
    render json: @scores
  end
  def show
    render json: @score
  end
  def create
    @score = Score.create(score_params)
    session[:scores] = {};
    session[:scores]["#{@score.round_id}"] = {}
    session[:scores]["#{@score.round_id}"]["#{@score.hole_id}"] = @score.score
    render json: @score
  end
  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @score.destroy
  end
  def set_score
    @score = Score.find(params[:id])
  end
  def score_params()
    params.require(:score).permit(:round_id, :hole_id, :score)
  end
end
