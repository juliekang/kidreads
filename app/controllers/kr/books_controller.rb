class Kr::BooksController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!
  

  def index
    @books = Book.all
    render :json => @books
  end

  def create
    @book = Book.new(params[:book]);

    if @book.save
      redirect_to book_url(@book);
    else
      render :json => @book.errors.full_messages, :status => 422
    end
  end

  def show
    @book = Book.find(params[:id])
  end

end
