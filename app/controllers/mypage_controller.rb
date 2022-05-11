class MypageController < ApplicationController
  def show
    # @articles = current_user.articles
    @articles = current_user.articles.order(:id).page params[:page]
  end

  def search
    @articles = Article.search(params[:title])
    @articles = @articles.page(params[:page])
    @title = params[:title]
    render "show"
  end
end
