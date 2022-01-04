class GamesController < ApplicationController

  def index
    if Game.all.empty?
      redirect_to new_game_path
    else
      @games = Game.all
    end
  end

  def new
    @game = Game.new
    @personas = Persona.all
  end

  def create
    # Computer
    @computer_persona = Persona.all.sample.id # Choix d'un persona aléatoire pour le computer
    @computer_persona = Persona.find(@computer_persona)
    # Création du ComputerPersona
    @instance_computer_persona = ComputerPersona.create(name: @computer_persona['name'], url: @computer_persona['url'], gender: @computer_persona['gender'], hat_color: @computer_persona['hat_color'], hair_color: @computer_persona['hair_color'], hair_length: @computer_persona['hair_length'], eyes: @computer_persona['eyes'], nose: @computer_persona['nose'], mustache: @computer_persona['mustache'], beard: @computer_persona['beard'], face_shape: @computer_persona['face_shape'], glasses: @computer_persona['glasses'], earrings: @computer_persona['earrings'], face_color: @computer_persona['face_color'] )

    # User
    @user_persona = Persona.find(params[:game][:persona_id].to_i) #Récupération du choix de l'utilisateur
    # Création du UserPersona
    @instance_user_persona = UserPersona.create(name: @user_persona['name'], url: @user_persona['url'], gender: @user_persona['gender'], hat_color: @user_persona['hat_color'], hair_color: @user_persona['hair_color'], hair_length: @user_persona['hair_length'], eyes: @user_persona['eyes'], nose: @user_persona['nose'], mustache: @user_persona['mustache'], beard: @user_persona['beard'], face_shape: @user_persona['face_shape'], glasses: @user_persona['glasses'], earrings: @user_persona['earrings'], face_color: @user_persona['face_color'] )

    # Game
    @game = Game.new(winner: [@user_persona, @computer_persona]) # Création de la game
    @game.computer_persona_id = @instance_computer_persona['id'] # Attribution du computer_persona_id à Game
    @game.user_persona_id = @instance_user_persona['id'] # Attribution de l'user_persona_id à Game
    @game.user = current_user # Attribution de l'user_id à Game
    @game.persona = @user_persona
    @game.save!

    # Création d'un round
    @round = Round.create!(game_id: @game.id, position: 1)

    redirect_to edit_game_round_path(@game, @round)
  end
end
