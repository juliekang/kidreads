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

require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
