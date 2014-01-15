# == Schema Information
#
# Table name: books
#
#  id            :integer          not null, primary key
#  isbn          :string(255)
#  title         :string(255)      not null
#  author        :string(255)      not null
#  pub_year      :integer
#  genre         :string(255)
#  num_pages     :integer
#  reading_level :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
