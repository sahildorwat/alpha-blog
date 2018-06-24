class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destory]
    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end

    def create
        # render plain: params[:article].inspect
        @article= Article.new(article_params)
        if @article.save
            flash[:notice] = "article is successfully stored"
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
            flash[:notice] = "article is successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        if @article.destroy
            flash[:notice] = 'aerticle is succesfully deleted'
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
        params.require(:article).permit(:title, :description)
    end

end


