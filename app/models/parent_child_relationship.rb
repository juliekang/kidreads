# == Schema Information
#
# Table name: parent_child_relationships
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  child_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ParentChildRelationship < ActiveRecord::Base
  attr_accessible :child_id, :parent_id

  belongs_to :child, :class_name => "User", :foreign_key => :child_id, :primary_key => :id
  belongs_to :parent, :class_name => "User", :foreign_key => :parent_id, :primary_key => :id
end
