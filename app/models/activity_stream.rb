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

class ActivityStream < ActiveRecord::Base
  attr_accessible :activity_object, :activity_verb, :url, :user_id, :club_id,
                  :first_name, :last_name, :club_name, :username, :image_url

  belongs_to :user
  belongs_to :club
end
