class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "mike", password: "2040mullenlabs", except: [:index, :show]

  def new
  end

  def create
  	@article = Article.new(article_params)
  	@article.save
  	redirect_to @article
  end

  def show
  	@article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
