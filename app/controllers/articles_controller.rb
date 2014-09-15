class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
	def new
		@article = Article.new
	end

	def create #the new action send its form data to the create action
		@article = Article.new(article_params)
		@article.save
		flash.notice = "A new Article created!"
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article #{@article.title} successfully deleted"
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update #the edit action send its form data to the update action
		@article = Article.find(params[:id])
		@article.update(article_params)
		redirect_to article_path(@article)
	end
		def article_params
			params.require(:article).permit(:title, :body, :tag_list)
		end
	
end
