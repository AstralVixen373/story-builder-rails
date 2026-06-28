class DashboardController < ApplicationController
  def index
    @character_count = Character.count
    @location_count = Location.count
    @scene_count = Scene.count
    @word_count = Scene.sum("array_length(regexp_split_to_array(trim(content), '\\s+'), 1)")
    @recent_scenes = Scene.includes(:chapter).order(updated_at: :desc).limit(5)
  end
end
