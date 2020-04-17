class Admin::UserController < Admin::Base

    def index 
        @user = User.all(created_at: :desc).page(params[:page]).per(15)
    end 

    def search 
        @users = User.search(params[:q])
        render "index"
    end

    def show
        @user = User.find(params[:id])
    end

    def new 
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            redirect_to [:admin, @user], notice: "ユーザーを作成しました。"
        else
            render "new"
        end
    end

    def update 
        @user = User.find(params[:id])
        @user.assign_attributes(user_params)
        if @user.save 
            redirect_to [:admin, @user], notice: "ユーザーを編集しました。"
        else
            render "edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.delete
        redirect_to :admin_user, notice: "ユーザーを削除しました。"
    end

    private def user_params
        params.require(:user).permit(
            :user_image
            :name,
            :full_name,
            :email,
            :password,
            :administrator
        )
    end
end
