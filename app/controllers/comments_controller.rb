class CommentsController < ApplicationController

	def create 
	   @article=Article.find(params[:article_id])
    
	   @comment = @article.comments.create(comment_params)
	   @comment.user_id=current_user.id
      if @comment.save 
        flash[:success] = "Comment added successfully!"
       	redirect_to @article
      else 
         flash[:alert] = "Could not add comment, please try again!"
        redirect_to @article    
    end 
  end

  def destroy
    @article = Article.find params[:article_id]
    @comment = @article.comments.find params[:id]
    @comment.destroy
    redirect_to article_path(@article)
  end

   private

   def comment_params
        params.require(:comment).permit( :article_id, :body,:user_image,:user_id, :author)
   end
end
