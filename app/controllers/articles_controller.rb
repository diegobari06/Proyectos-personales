class ArticlesController < ApplicationController
before_action :authenticate_user!, only: [:create,:new]
before_action :set_article, except: [:index,:new,:create,:myArticles]
before_action :authenticate_editor!, only: [:new,:create,:update]
before_action :authenticate_admin!, only: [:destroy,:publish]


#GET articles
  #accede con verbo get y el index que utiliza es el que esta en la carpeta views/articles/index
  def myArticles
#traerse todos los elementos de articles de la base de datos y guardarlos en @articles para accederlos desde la vista

  end
  def index
#traerse todos los elementos de articles de la base de datos y guardarlos en @articles para accederlos desde la vista

    @articles = Article.paginate(page: params[:page],per_page:9).publicado.latest
  end
#GET articles/:id
  def show
    @omment = Omment.new
  end

#GET articles/new
def new
  @article = Article.new
  @categories = Category
end
#POST articles
def create

  @article = current_user.articles.new(article_params)
  @article.categories = params[:categories]
if  @article.save
  redirect_to @article
else
  render :new
end

end

def edit

end

def destroy

  @article.destroy
    redirect_to articles_path
end
def publish
@article.publish!
redirect_to @article
end
def update


  if @article.update(article_params)
  redirect_to @article
  else
    render :edit
  end
end

private

def set_article
    @article = Article.find(params[:id])
end

def validate_user
  redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
end

def article_params
  params.require(:article).permit(:title,:body,:cover,:categories,:markup_body)
end



end
