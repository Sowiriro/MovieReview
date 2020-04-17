class MovieImagesController < ApplicationController

  before_action :login_required

  before_action do 
    @movie = current_member.movies.find(params[:movie_id])
  end

  def index
    @images = @movie.images.order(:id)
  end

  def show
    redirect_to action: "edit"
  end

  def new
    @image = @movie.images.build
  end

  def edit
    @image = @movie.iamges.find(params[:id])
  end

  def create 
    @image = @movie.images.build(image_params)
    if @image.save 
      redirect_to [@movie, :images], notice: "画像を作成しました"
    else
      render "new"
    end
  end

  def update 
    @image = @movie.images.find(params[:id])
    @image.assign_attributes(image_params)
    if @image.save 
      redirect_to [@movie, :images], notice: "画像を編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @image = @movie.images.find(params[:id])
    @image.delete
    redirect_to [@moive, :images], notice: "画像を削除しました"
  end

  private def image_params 
    params.require(:image).permit(
      :new_data, 
      :alt_text
    )
  end
end
