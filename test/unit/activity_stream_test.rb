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
#  username        :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  club_name       :string(255)
#  image_url       :string(255)
#

require 'test_helper'

class ActivityStreamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
