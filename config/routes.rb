Rails.application.routes.draw do

# resources set up all URLS to be used for controllers and models
# tidy up comments to reviews routes
resources :reviews do
  resources :comments
end

# add resources to users model to apply routes methods
resources :users

# add resources for sessions
resource :session

# lists all reviews as index page
root "reviews#index"

end
