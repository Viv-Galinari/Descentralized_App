Rails.application.routes.draw do

  ActiveAdmin.routes(self)
# resources set up all URLS to be used for controllers and models
# Link up comments to reviews routes
# bookmark is singular as we can only bookmark one review per user
resources :reviews do
  resources :comments
  resource :bookmark
end

# add resources to users model to apply routes methods
resources :users

# add resources for sessions
resource :session

# lists all reviews as index page
root "reviews#index"

end
