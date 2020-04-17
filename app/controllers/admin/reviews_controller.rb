class Admin::ReviewsController < Admin::Base
    def index
        @reviews = Review.all(created_at: :desc)
    end

    def show
        @review = Review.find(params[:id])
    end

    def new 
        @review = Review.new
    end

    def edit
        @review = Review.find(params[:id])
    end

    def create
        @review = Review.new(review_params)
        if @review.new
            redirect_to [:admin, @review], notice: "レビューを作成しました"
        else
            render "new"
        end
    end
    
    def update 
        @review = Review.find(params[:id])
        @review.assign_attributes(review_params)
        if @review.save
            redirect_to [:admin, @review], notice: "レビューを編集しました。"
        else
            render "edit"
        end
    end

    def delete
        @review = Review.find(params[:id])
        @review.delete
        redirect_to :admin_reviews, notice: "レビューを削除しました"
    end

    private def review_params
        params.require(:review).permit(
            :title,
            :body
        )
    end
end
