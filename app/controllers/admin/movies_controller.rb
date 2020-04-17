class Admin::MoviesController < Admin::Base

    def index
        @movies = Movie.all(released_at: :desc)
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def new 
        @movie = Movie.new
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def create 
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to [:admin, @movie], notice: "映画を作成しました。"
        else
            render "new"
        end
    end

    def update 
        @movie = Movie.find(params[:id])
        @movie.assign_attributes(mvoie_params)
        if @movie.save
            redirect_to [:admin, @movie], notice: "ユーザーを編集しました"
        else
            render "edit"
        end
    end

    def delete
        @movie = Movie.find(params[:id])
        @movie.delete
        redirect_to :admin_movies, notice: "ユーザーを削除しました"
    end

    private def movie_params
        params.require(:movie).permit(
            :title,
            :body,
            :released_at,
            :image_name
        )
    end

end
