class MypageController < ApplicationController
  def show
    # @articles = current_user.articles
    @articles = current_user.articles.order(:id).page params[:page]
  end
end
