class Kr::BooksController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!
  
  def index
    @book_statuses = current_user.book_statuses.includes(:book)
    book_ids = @book_statuses.map(&:book_id)
    @reviews = current_user.reviews.where(:book_id => book_ids).order(:book_id)
  end

  def create
    @book = Book.new(params[:book])

    if @book.save
      render :json => @book
    else
      render :json => @book.errors.full_messages, :status => 422
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end

end
