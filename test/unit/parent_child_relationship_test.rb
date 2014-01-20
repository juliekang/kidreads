# == Schema Information
#
# Table name: parent_child_relationships
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  child_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ParentChildRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
