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

# custom urls for about page and T&C. 'Get' means pull and view page
get "about", to: "pages#about"
get "terms", to: "pages#terms"
get "jobs", to: "pages#jobs"

# lists all reviews as index page
root "pages#home"

get "home", to: "pages#home"

end
