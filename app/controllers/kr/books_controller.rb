class Kr::BooksController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!
  

  def index
    if params[:query].present?
      @books = Book.search(params[:query])
    else
      @books = current_user.books
      @book_statuses = BookStatus.where(user_id: current_user.id)
    end
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
    render :json => @book
  end

  def update

  end


end
