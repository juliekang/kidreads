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

require 'test_helper'

class ClubMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
