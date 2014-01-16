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

class BookStatus < ActiveRecord::Base
  attr_accessible :user_id, :book_id, :status
  validates :user_id, :book_id, :status, :presence => true
  validates_uniqueness_of :user_id, :scope => [:book_id]

  belongs_to :user
  belongs_to :book
end
