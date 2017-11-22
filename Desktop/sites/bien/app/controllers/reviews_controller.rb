class ReviewsController < ApplicationController

  # check if logged in
  before_action :check_login, except: [:index, :show]

  # Index is our list page for our reviews
  def index

    # We create filters so user can filter content
    # Filters are created by using variables and params(such as price filter)
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    # start with all reviews from the Model (data)
    @reviews = Review.all

    # Filter by price
    # Run if statement to check if there is price
      if @price.present?
        # if there is price, set a new variable to get all of these reviews (@reviews = Review.all)
        # And replace to reviews where there is a price
          @reviews = @reviews.where(price: @price)
        end

        # Filter by cuisine
        if @cuisine.present?
          @reviews = @reviews.where(cuisine: @cuisine)
        end

        # search near the location
       if @location.present?
         @reviews = @reviews.near(@location)
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
  # Use params to require reviews, allowing users to only add what's required
  # Symblos are variables that dont change
  def create
    # take info from the form and add it to the model
    @review = Review.new(form_params)

    # and then associate it with a user
    @review.user = @current_user

    # we want to check if the model can be saved
    # if it is, we're go the home page again
    # if it isn't, show the new form
    if @review.save
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"
    end

  end

  def show
    # individual review page
    @review = Review.find(params[:id])
  end

# To delete a review
# Find the individual review
# destroy (delete) review
# redirect to the homepage
def destroy
  # find the individual review
  @review = Review.find(params[:id])

  # destroy if they have access
  if @review.user == @current_user
    @review.destroy
  end

  # redirect to the home page
  redirect_to root_path
end

def edit
  # find the individual review (to edit)
  @review = Review.find(params[:id])

  if @review.user != @current_user
    redirect_to root_path
  elsif @review.created_at < 1.hour.ago
    redirect_to review_path(@review)
  end
end

  # To update a review
  # find the individual review
  # update database with the new info from the form
  # redirect somewhere new
  # If there is any validation error when inputing the review
  # redirect user to edit page
  def update
     # find the individual review
     @review = Review.find(params[:id])

     if @review.user != @current_user
       redirect_to root_path
     else
       # update with the new info from the form
       if @review.update(form_params)

         # redirect somewhere new
         redirect_to review_path(@review)
       else
         render "edit"
       end
     end
   end

   def form_params
     params.require(:review).permit(:title, :restaurant, :body, :score,
       :ambiance, :cuisine, :price, :address, :photo)
   end

 end
