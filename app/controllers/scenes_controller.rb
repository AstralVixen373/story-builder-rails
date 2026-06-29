class ScenesController < ApplicationController
  before_action :set_chapter
  before_action :set_scene, only: [ :edit, :update, :destroy ]

  def new
    @scene = @chapter.scenes.build(position: @chapter.scenes.count + 1)
  end

  def create
    @scene = @chapter.scenes.build(scene_params)
    @scene.position ||= @chapter.scenes.count + 1
    if @scene.save
      redirect_to edit_chapter_scene_path(@chapter, @scene), notice: "Scene created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @scene.update(scene_params)
      redirect_to edit_chapter_scene_path(@chapter, @scene), notice: "Scene saved."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @scene.destroy
    redirect_to @chapter, notice: "Scene deleted."
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def set_scene
    @scene = @chapter.scenes.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:title, :content, :position)
  end
end
