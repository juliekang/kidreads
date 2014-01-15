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

class Book < ActiveRecord::Base
  attr_accessible :title, :author

  has_many :reviews
end
