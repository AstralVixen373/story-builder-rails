class CharactersController < ApplicationController
  before_action :set_character, only: [ :show, :edit, :update, :destroy ]

  def index
    @characters = Character.includes(:locations, :linked_characters).order(:name)
  end

  def show
    @all_characters = Character.where.not(id: @character.id).order(:name)
    @all_locations = Location.order(:name)
    @linked_characters = (@character.linked_characters + @character.inverse_linked_characters).uniq
    @linked_location_ids = @character.locations.pluck(:id)
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to @character, notice: "Character created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: "Character updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_path, notice: "Character deleted."
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :description)
  end
end
