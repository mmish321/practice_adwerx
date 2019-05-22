class CommentsController < ApplicationController
	def new
		@article = Article.find(params[:article_id])
		@comment = Comment.new
	end
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		if @comment.save
			redirect_to article_path(@article)
		else
			render "edit"
		end
	end
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end
	def edit
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end

	def update
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to @article
		else
			render "edit"
		end
	end
	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
