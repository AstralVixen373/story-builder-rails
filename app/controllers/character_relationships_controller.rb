class CharacterRelationshipsController < ApplicationController
  before_action :set_character

  def create
    linked = Character.find(params[:linked_character_id])
    already_linked = @character.linked_characters.include?(linked) ||
                     @character.inverse_linked_characters.include?(linked)
    @character.linked_characters << linked unless already_linked
    redirect_to @character
  end

  def destroy
    rel = @character.character_relationships.find_by(linked_character_id: params[:id])
    rel ||= CharacterRelationship.find_by(character_id: params[:id], linked_character_id: @character.id)
    rel&.destroy
    redirect_to @character
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
