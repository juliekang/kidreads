# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  book_id    :integer          not null
#  user_id    :integer          not null
#  rating     :float            not null
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :book_id, :user_id, :rating, :review

  belongs_to :user, :book
end
