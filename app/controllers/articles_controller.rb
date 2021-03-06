class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_install)
    @article.user = User.first
    if @article.save
      flash[:notice] = " Article was Created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
        if @article.update(params_install)
          flash[:notice] = "article was updated successfull"
          redirect_to @article
        else
          render 'edit'
        end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_install
    params.require(:article).permit(:title, :description)
  end

end
