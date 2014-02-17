class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "mike", password: "2040mullenlabs", except: [:index, :show]

  def new
  end

  def create
  	@article = Article.new(article_params)
  	@article.save
  	redirect_to @article
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])

  	if @article.update(params[:article].permit(:sort_date, :author, :title, :text, :photo, :imgcap))
  	  redirect_to @article
  	else
      render 'edit'
    end
  end

  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:sort_date, :author, :title, :text, :photo, :imgcap)
    end

end
