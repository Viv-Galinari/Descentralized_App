class PagesController < ApplicationController

  def home
    @content = Page.find_by(url: "home")

    # variable to get highly scored reviews in the homepage
    @highly_rated_reviews = Review.where("score >= 8")

    # variable to get reviews that are featured
    @featured_reviews = Review.where(is_featured: true)
  end


  def about
    @content = Page.find_by(url: "about")
  end

  def terms
    @content = Page.find_by(url:"terms")
  end

  def jobs
    @content = Page.find_by(url: "jobs")
  end

end
