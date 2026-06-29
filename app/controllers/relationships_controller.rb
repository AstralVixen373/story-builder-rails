class RelationshipsController < ApplicationController
  def index
    characters = Character.includes(:locations, :linked_characters, :inverse_linked_characters).all
    locations = Location.all

    @graph_data = {
      characters: characters.map do |c|
        linked_ids = (c.linked_characters.map(&:id) + c.inverse_linked_characters.map(&:id)).uniq
        {
          id: c.id,
          name: c.name,
          location_ids: c.locations.map(&:id),
          linked_character_ids: linked_ids
        }
      end,
      locations: locations.map { |l| { id: l.id, name: l.name } }
    }.to_json
  end
end
