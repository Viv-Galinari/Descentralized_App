class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any page loads, find the current_user
  # an action is any of ruby's pre-made function, index, new, show, create, destroy etc
  before_action :find_current_user

  # add in the method to use in the views (share my code within views and controllers)
  helper_method :is_logged_in?

  # this finds the current user if logged in
  def find_current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      # setting variable to nil solves the issue we would have when logging out
      # where it cant find a user an empty id
      # nil is a ruby way of saying 'nothing'
      @current_user = nil
    end
  end

  # Function that check login state and redirect users to login page, if they are not logged in
  # This will protect us from hacking the url in the browser and write review without logged in
  # because we have this in our applications controller I can use all accross my site
  # Check_login on reviews controller
  # unless is the opposite of 'if' and doesnt need 'else'
  def check_login
    unless is_logged_in?
      redirect_to new_session_path
    end
  end

  # cleaning up code. Move 'session[:user_id]' to its own funciton/moe
  # is the person logged in
  def is_logged_in?
    session[:user_id].present?
  end

# check admin login status
def check_admin
  @user = find_current_user
  unless @user.present? and @user.is_admin
    redirect_to root_path
  end
end

# find admin user
#  first find current user, then check if loggedin AND is_admin
#  if so, get back user, otherwise 'nil'
  def find_admin_user
    @current_user = find_current_user

      if @curent_user.present? and @current_user.is_admin
        @current_user
      else
        nil
      end

 end
end
