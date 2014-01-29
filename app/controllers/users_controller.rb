class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show, :edit, :update]

  def index
    if logged_in?
      @users = current_user.children
    else
      @users = nil
    end
    render :json => @users
  end

  def create
    logout_current_user! if current_user && current_user.guest? && !creating_kid?
    @user = User.new(params[:user])

    if @user.save
      if !creating_kid?
        self.current_user = @user
        redirect_to root_url
      else
        @parent_child_relationship = ParentChildRelationship.create!(
        parent_id: current_user.id,
        child_id: @user.id
        )
        render :json => @user
      end
    else
      flash[:errors] = @user.errors.full_messages
      @user_types = UserType.all
      render :new

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
    redirect_to edit_user_url(current_user.id) if params[:id] != current_user.id.to_s
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to root_url
    else
      render :json => @user.errors.full_messages, :status => 422
    end
  end

  def edit
    redirect_to edit_user_url(current_user.id) if params[:id] != current_user.id.to_s
    @user = current_user
    @user_types = UserType.all
  end

  private
  def creating_kid?
    params[:user_type_id].to_i == 1
  end

end