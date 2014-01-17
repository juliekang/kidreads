class DropLeaderIdFromClubs < ActiveRecord::Migration
  def change
    remove_column :clubs, :leader_id
  end
end
