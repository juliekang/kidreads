class Kr::ClubMembershipsController < ApplicationController
  respond_to :json
  before_filter :require_current_user!

  def index
    @club_memberships = current_user.club_memberships
    render :json => @club_memberships
  end

  def create
    @club_membership = ClubMembership.new(params[:club_membership]);

    if @club_membership.save
      render :json => @club_membership
    else
      render :json => @club_membership.errors.full_messages, :status => 422
    end
  end

end
