class CommentsController < ApplicationController

  def create
    # We can't get the params to find :id as we are not within Review model
    # Instead we use association to find params [:review_id]
    @review = Review.find(params[:review_id])
    # add a brand new comment inside @review passing data requirements as argument
    # we require that there is some information about the comment within the params
    # and we only allow the body to be submited
    @comment = @review.comments.new(params.require(:comment).permit(:body))
    # save comment in the database
    @comment.save
    # redirect to review show page
    redirect_to review_path(@review)
  end

end
