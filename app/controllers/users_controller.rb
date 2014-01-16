class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show, :update]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
    @user_types = UserType.all
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
      render :json => @user
    else
      render :json => current_user
    end
  end

  def update

  end
end