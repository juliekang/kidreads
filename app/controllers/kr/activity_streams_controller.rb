class Kr::ActivityStreamsController < ApplicationController
  respond_to :json
  before_filter :require_current_user!

  def index
    @streams = current_user.activity_stream_objects
  end

  def create
    @stream = ActivityStream.new(params[:activity_stream]);
    @stream.user_id = current_user.id
    @stream.username = current_user.username
    @stream.first_name = current_user.first_name
    @stream.last_name = current_user.last_name

    if @stream.save
      render :json => @stream
    else
      render :json => @stream.errors.full_messages, :status => 422
    end
  end

end