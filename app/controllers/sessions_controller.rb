class SessionsController < ApplicationController
  before_filter :require_no_current_user!, :only => [:create, :new]
  before_filter :require_current_user!, :only => [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Sorry, we could not find a user with that username or password.  Please try again."]
      render :new
    else
      self.current_user = user
      redirect_to root_url
    end
  end

  def destroy
    logout_current_user!
    redirect_to root_url
  end

  def new
  end
  
end