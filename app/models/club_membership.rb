# == Schema Information
#
# Table name: club_memberships
#
#  id              :integer          not null, primary key
#  member_id       :integer
#  club_id         :integer
#  membership_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ClubMembership < ActiveRecord::Base
  attr_accessible :club_id, :member_id, :membership_type

  validates :club_id, :member_id, :membership_type, :presence => true
  validates_uniqueness_of :member_id, :scope => [:club_id]
end
