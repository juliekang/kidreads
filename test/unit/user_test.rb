# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_type_id    :integer          not null
#  username        :string(255)      not null
#  email           :string(255)      not null
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  city            :string(255)
#  state           :string(255)
#  birthday        :date
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  points          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
