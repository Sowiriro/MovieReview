class MoviesController < ApplicationController

    def index 
        @movies = Movie.order(released_at: :desc).page(params[:page]).per(15)
    end

    def show
        @movie = Movie.find_by(id: params[:id])
        @movie = Movie.find(params[movie_id])
        @movies_reviews = @movie.reviews.order(created_at: :desc).page(params[:page]).per(5)  #映画のレビュー
    end

    def new 
        @movie = Movie.new
    end 

    def edit 
        @movie = Movie.find(params[:id])
    end

    def create
        @movie = Movie.new(movie_params)
        @movie.image_name = "default_user.jpg"
        if @movie.save 
            redirect_to @movie, notice: "映画を作成しました"
        else 
            render "new"
        end
    end

    def update 
        @movie = Movie.find_by(id: params[:id])
        @movie.assign_attributes(movie_params)
        if params[:image]
            @movie.image_name = "#{@movie.id}.jpg"
            image = params[:image]
            File.binwrite("public/movie_image/#{@movie.image_name}", image.read)
        end
        if @movie.save
            redirect_to @movie, notice: "映画を編集しました"
        else
            render "edit"
        end

    end

    def delete
        @movie = Movie.find_by(id: params[:id])
        @movie.delete
        redirect_to :movies
    end

    private def movie_params
        params.require(:movie).permit(
            :title,
            :body,
            :released_at
        )
    end
end