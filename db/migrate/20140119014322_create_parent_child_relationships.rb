class CreateParentChildRelationships < ActiveRecord::Migration
  def change
    create_table :parent_child_relationships do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
    add_index :parent_child_relationships, :parent_id
    add_index :parent_child_relationships, :child_id
  end
end
