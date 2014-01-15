class Api::BooksController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!, :only => [:index, :create, :update]

  def create
    @book = Book.new(params[:book]);

    if @book.save
      render :json => @book
    else
      render :json => @book.errors.full_messages, :status => 422
    end
  end

  def show
    @book = current_user.books.find
  end

  def update
  end
end
