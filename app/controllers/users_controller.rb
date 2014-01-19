class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show, :update]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to root_url
    else
      render :json => @user.errors.full_messages, :status => 422
    end
  end

  def new
    @user = User.new
    @user_types = UserType.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end
end