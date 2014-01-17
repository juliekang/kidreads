# == Schema Information
#
# Table name: clubs
#
#  id         :integer          not null, primary key
#  leader_id  :integer
#  club_name  :string(255)
#  club_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Club < ActiveRecord::Base
  attr_accessible :club_name, :club_type, :founder_id

  validates :club_name, :club_type, :founder_id, :presence => true
  validates :club_name, :uniqueness => true
end
