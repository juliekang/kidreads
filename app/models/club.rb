# == Schema Information
#
# Table name: clubs
#
#  id         :integer          not null, primary key
#  club_name  :string(255)
#  club_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Club < ActiveRecord::Base
  attr_accessible :club_name, :club_type

  has_many :club_memberships
  has_many :members, :through => :club_memberships
  has_many :activity_streams

  validates :club_name, :club_type, :presence => true
  validates :club_name, :uniqueness => true

  def leader
    club_memberships.find_by_membership_type('leader').member
  end
end
