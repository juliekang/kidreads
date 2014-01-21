# == Schema Information
#
# Table name: activity_streams
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  club_id         :integer
#  url             :string(255)
#  activity_verb   :string(255)
#  activity_object :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ActivityStreamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
