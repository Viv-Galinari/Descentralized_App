class ReviewsController < ApplicationController

  def index
    # This is our list page for our reviews

   @number = rand(100)

   @reviews = Review.all
  end

  # This is the form for adding a new review
  def new #define a new page
    @review = Review.new #
  end

  # Take the infor from the form and add to the database (
  # create a new row in the database
  def create
    # Use params to require reviews, allowing users to only add 3 things
    # Symblos are variables that dont change
    @review = Review.new(form_params)

    # save this to the database
    @review.save

    # redirect back to the homepage
    redirect_to root_path
  end

  # Individual review page
  def show
    @review= Review.find(params[:id])
  end

# Find the individual review
# destroy (delete) review
# redirect to the homepage
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

# Find individual review to edit it
  def edit
    @review = Review.find(params[:id])
  end

  # Update review to database
  def
    @review = Review.find(params[:id])
    @review.update(form_params)
    redirect_to review_path(@review)
  end

  def form_params
    params.require(:review).permit(:title, :body, :score)
  end

end
