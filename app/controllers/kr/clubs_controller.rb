class Kr::ClubsController < ApplicationController
  respond_to :json, :html
  before_filter :require_current_user!

  def index
    @clubs = current_user.clubs
    render :json => @clubs
  end

  def create
    @club = Club.new(params[:club])
    if @club.save
      @club_membership = ClubMembership.create!(
        member_id: current_user.id,
        club_id: @club.id,
        membership_type: 'leader'
      )
      render :json => @club
    else
      render :json => @club.errors.full_messages, :status => 422
    end
  end

  def show
    @club = Club.find(params[:id])
    render :json => @club
  end

  def update
  end

  def destroy
  end
end
