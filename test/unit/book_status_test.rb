# == Schema Information
#
# Table name: book_statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  book_id    :integer          not null
#  status     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
