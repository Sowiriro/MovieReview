class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @account = current_user
    @user = User.find(params[:user_id])
    @users_reviews = @user.reviews 　#ユーザーのレビュー
  end


  
end
