class RoundsController < ApplicationController
  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    @round.save
  end

  def edit
    @personas = Persona.all
    @game = Game.find(params[:game_id])
    @round = Round.find(params[:id])
  end

  def update
    @persona = Persona.all
    @round = Round.find(params[:id])
    @round.update()

    redirect_to edit_game_round_path(@round)
  end

  private

  def round_params
    params.require(:round).permit(:user_feature, :user_adjective)
  end
end
