# == Schema Information
#
# Table name: user_types
#
#  id          :integer          not null, primary key
#  label       :string(255)      not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserType < ActiveRecord::Base
  attr_accessible :label, :description

  has_many :users
end
