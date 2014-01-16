class BookStatus < ActiveRecord::Base
  attr_accessible :user_id, :book_id, :status
  validates :user_id, :book_id, :status, :presence => true
  validates :user_id, scope => {:book_id}, :uniqueness => true

  belongs_to :user
  belongs_to :book
end
