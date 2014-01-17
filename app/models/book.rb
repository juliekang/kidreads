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
#  goodreads_id  :string(255)
#  image_url     :string(255)
#  ratings_count :integer
#  ratings_sum   :integer
#

class Book < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :title,  :analyzer => 'snowball', :boost => 100
    indexes :author, :analyzer => 'snowball', :boost => 30
  end

  attr_accessible :title, :author, :isbn, :pub_year, :genre, :num_pages, :reading_level, :image_url

  validates :title, :author, :presence => true
  validates :isbn, :uniqueness => true, :allow_nil => true

  has_many :reviews
  has_many :book_statuses
  has_many :users, :through => :book_statuses
end
