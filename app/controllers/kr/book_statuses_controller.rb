class Kr::BookStatusesController < ApplicationController
  respond_to :json
  before_filter :require_current_user!

  def index
    @book_statuses = current_user.book_statuses
    render :json => @book_statuses
  end

  def create
    @book_status = BookStatus.new(params[:book_status]);
    @book_status.user_id = current_user.id

    if @book_status.save
      render :json => @book_status
    else
      render :json => @book_status.errors.full_messages, :status => 422
    end
  end

  def update
    @book_status = BookStatus.find(params[:id]);

    if @book_status.update_attributes(params[:book_status])
      render :json => @book_status
    else
      render :json => @book_status.errors.full_messages, :status => 422
    end
  end

end
