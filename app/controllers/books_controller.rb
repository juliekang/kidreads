class BooksController < ApplicationController
  before_filter :require_current_user!, :only => [:new, :create, :update]

  def new
  end

  def create
  end

  def show
  end

  def update
  end
end
