class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @invoice = Invoice.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    byebug
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:name, :description, :price, :qty, :invoice_id)
    end

end
