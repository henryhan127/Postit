class CommentsController < ApplicationController
  before_action :require_user
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "A new comment was created."
      redirect_to post_path(@post)
    else
      flash[:error] = "You can't create a blank comment."
      redirect_to :back
    end
  end

  def vote
    comment = Comment.find(params[:id])
    vote = Vote.create(vote: params[:vote], creator: current_user, votable: comment)
    if vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote on a comment once."
    end
    
    redirect_to :back    
  end

end