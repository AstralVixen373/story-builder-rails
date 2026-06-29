class CharacterLocationsController < ApplicationController
  before_action :set_character

  def create
    location = Location.find(params[:location_id])
    @character.locations << location unless @character.locations.include?(location)
    redirect_to @character
  end

  def destroy
    location = Location.find(params[:id])
    @character.locations.delete(location)
    redirect_to @character
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
