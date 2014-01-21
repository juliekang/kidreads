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

class ActivityStream < ActiveRecord::Base
  attr_accessible :activity_object, :activity_verb, :url, :user_id, :club_id

  belongs_to :user
  belongs_to :club
end
