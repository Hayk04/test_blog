class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @article.tags.build
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)      
    else  
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else  
      render 'show'
    end  
  end

  def find_article
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:headline, :content, tags_attributes: [:id, :tag_body])
  end
end
