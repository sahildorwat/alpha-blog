class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy] 
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]


    def new
        @article = Article.new
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def create
        # render plain: params[:article].inspect
        @article= Article.new(article_params)
        @article.user = current_user;
        if @article.save
            flash[:success] = "article is successfully stored"
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
         if @article.update(article_params)
            flash[:success] = "article is successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:danger] = 'aerticle is succesfully deleted'
            redirect_to articles_path
        else
            redirect_to article_path(@article)
        end
    end


    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        # debugger
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:danger] = "You are not allowed to edit"
            redirect_to root_path
        end
    end
end


