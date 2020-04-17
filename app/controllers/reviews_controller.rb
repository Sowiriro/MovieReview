class ReviewsController < ApplicationController

    before_action :login_required, except: [:index]

    def index 
        @reviews = Review.order(created_at: :desc).page(params[:page]).per(10)  #新しい順のレビュー全て
    end

    def show
        @review = Review.find(id: params[:id])
        @user = @review.user
    end

    def new 
        @review = Review.new
    end

    def edit
        @review = Review.find(id: params[:id])
    end

    def create
        @review = Review(review_params)
        if @review.save 
            redirect_to @review, notice: "Reviewを作成しました"
        else
            render "new"
        end
    end

    def update
        @review = Review.find(id: params[:id])
        @review.assign_attributes(review_params)
        if @review.save 
            redirect_to @review, notice: "Reviewを編集しました"
        else
            render "edit"
        end

    end

    def destroy
        @review = Review.find(id: params[:id])
        @review.destroy
        redirect_to :reviews
    end

    def like 
        @review = Review.find(params[:id])
        current_user.liked_reviews << @review
        redirect_to @review, notice: "投票しました"
    end

    def unlike 
        current_user.liked_reviews.order(created_at: :DESC).page(params[:page]).per(15)
    end

    private def review_params
        params.require(:review).permit(
            :title,
            :body
        )
    end

end
