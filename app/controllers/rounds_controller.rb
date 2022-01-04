class RoundsController < ApplicationController

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    @round.save
  end

  def edit
    @persona = Persona.all
    @game = Game.find(params[:game_id])
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])
    @round.update
  end

  private

  def round_params
    params.require(:round).permit(:user_feature, :user_adjective, :computer_feature, :computer_adjective, :position)
  end
end
