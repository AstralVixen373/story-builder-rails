class ChaptersController < ApplicationController
  before_action :set_chapter, only: [ :show, :edit, :update, :destroy ]

  def index
    @chapters = Chapter.includes(:scenes).order(:position, :created_at)
  end

  def show
    @scenes = @chapter.scenes
  end

  def new
    @chapter = Chapter.new(position: Chapter.count + 1)
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.position ||= Chapter.count + 1
    if @chapter.save
      redirect_to @chapter, notice: "Chapter created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to @chapter, notice: "Chapter updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chapter.destroy
    redirect_to chapters_path, notice: "Chapter deleted."
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :description, :position)
  end
end
