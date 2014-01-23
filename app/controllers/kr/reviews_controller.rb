class Kr::ReviewsController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!

  def index
    @reviews = current_user.reviews.includes(:user)
  end

  def create
    @review = current_user.reviews.new(params[:review])

    if @review.save
      render :json => @review
    else
      render :json => @review.errors.full_messages, :status => 422
    end
  end

  def show
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      render :json => @review
    else
      render :json => @review.errors.full_messages, :status => 422
    end
  end

  def destroy
  end
end
