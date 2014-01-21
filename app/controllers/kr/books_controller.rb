class Kr::BooksController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!
  
  def index
    @books = current_user.books
    @book_statuses = BookStatus.where(user_id: current_user.id)
  end

  def create
    @book = Book.new(params[:book]);

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

  def update

  end


end
