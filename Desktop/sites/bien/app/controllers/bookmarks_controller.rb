class BookmarksController < ApplicationController

# check if logged in
before_action :check_login

  def create
    # find the review we ar booking marking
    @review = Review.find(params[:review_id])
    # create a new bookmark based on this reviews
    @bookmark = @review.bookmarks.new
    # attach our user to it
    @bookmark.user = @current_user
    # save bookmark to database
    @bookmark.save
    # redirect to review pages
    redirect_to review_path(@review)
  end

    def destroy
      # find the review we are booking marking
      @review = Review.find(params[:review_id])
      # find out if there is any bookmark on this review by the users
      # this will generate an array. Apply 'delete' method to delete anything in the list
      @review.bookmarks.where(user: @current_user).delete_all
      # redirect to review pages
      redirect_to review_path(@review)
    end


end
