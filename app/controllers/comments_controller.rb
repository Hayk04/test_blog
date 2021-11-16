class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :user_id, :article_id)
	end
end
