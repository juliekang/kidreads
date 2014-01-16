class Kr::ReviewsController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!
  load_and_authorize_resource

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
