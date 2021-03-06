class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ create update destroy ]

  def index
    # @articles = Article.all
    @articles = Article.order(:id).page params[:page]
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: t('notice.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: t('notice.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: t('notice.destroy')
  end

  def search
    @articles = Article.search(params[:title])
    @articles = @articles.page(params[:page])
    @title = params[:title]
    render "index"
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, tag_ids: []).merge(user_id: current_user.id)
    end

end
