class Kr::ActivityStreamsController < ApplicationController
  respond_to :json
  before_filter :require_current_user!

  def index
    @activity_streams = current_user.activity_stream_objects
  end

end