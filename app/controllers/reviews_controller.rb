class ReviewsController < ApplicationController

  # Index is our list page for our reviews
  # We only want a list of all of the reviews if there is no filter
  def index

    # We create filters so user can filter content
    # Filters are created by using params(such as price filter)
    @price = params[:price]
    @cuisine = params[:cuisine]

    # start with all reviews
    @reviews = Review.all

    # Filter by price
    # Run if statement to check if there is price
      if @price.present?
        # Set variable to show all reviews that have certain price to it
        # if there is price, get all of these reviews (@reviews = Review.all)
        # And replace to reviews where there is a price
          @reviews = reviews.where(price: @price)

        # Filter by cuisine
        if cuisine.present?
          @reviews = reviews.where(cuisine: @cuisine)
        end

  end

  # This is the form for adding a new review
  # define a new page
  def new
    @review = Review.new
  end

  # To create a new review
  # Take the information from the form and add to the database
  # this will create a new row in the database
  # Use params to require reviews, allowing users to only add 3 things
  # Symblos are variables that dont change
  def create
    @review = Review.new(form_params)

    # we want to check if the model can be saved
    # if can be saved, go to homepage again
    # with every if statement there is an end
    #  if can't be saved, show the view for new.html.erb
    if @review.save
      redirect_to root_path
    else
      render "new"
    end

  end

  # To show an individual review page
  def show
    @review= Review.find(params[:id])
  end

# To delete a review
# Find the individual review
# destroy (delete) review
# redirect to the homepage
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

# To find an individual review and to edit it
  def edit
    @review = Review.find(params[:id])
  end

  # To update review a review
  # find the individual review
  # update database with the new info from the form
  # redirect somewhere new
  # If there is any validation error when inputing the review
  # redirect user to edit page
  def update
    @review = Review.find(params[:id])
       if @review.update(form_params)
      redirect_to review_path(@review)
    else
      render "edit"
    end
  end

  def form_params
    params.require(:review).permit(:title,:restaurant, :ambiance, :body, :score, :price, :cuisine)
  end

end
