Rails.application.routes.draw do

# tidy up comments to reviews routes
resources :reviews do
  resources :comments
end


root "reviews#index"


end
