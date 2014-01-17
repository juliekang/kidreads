class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show, :update]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      render :json => @user
    else
      render :json => @user.errors.full_messages, :status => 422
    end
  end

  def new
    @user = User.new
    @user_types = UserType.all
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
      render :json => @user, :only => [:id, :username]
    else
      render :json => current_user, :only => [:id, :username]
    end
  end

  def index
    @users = User.all

    render :json => @users
  end

  def update

  end
end