class UsersController < ApplicationController

  # create an index function to list all users (plural)
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:id])
  end
  
# create NEW function to add users
# Define empty user to create a form in views. user variable equal to User Model
  def new
    @user = User.new
  end

  def create
    #  take the params from the form (the separated form bellow)
    #  create a new user
    @user = User.new(form_params)

    #  if it's valid and it saves, go to the page with all users
    #  if not, see the form with erros
    if @user.save
      # save the session with the user
      session[:user_id] = @user.id

      redirect_to users_path
    else
      render "new"
    end
  end

  # what fields to we need to capture (username, email, password and confirmation)
  # require params from the user and permit filds to pass througth
  def form_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
