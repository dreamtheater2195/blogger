class CommentsController < ApplicationController
	def create 
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]

		@comment.save
		redirect_to article_path(@comment.article)
	end

	def comment_params
		params.require(:comment).permit(:commenter,:body)
	end
end
# find the Article associated with this Comment by calling @comment.article