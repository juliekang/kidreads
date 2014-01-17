class CreateClubMemberships < ActiveRecord::Migration
  def change
    create_table :club_memberships do |t|
      t.integer :member_id
      t.integer :club_id
      t.string :membership_type

      t.timestamps
    end
    add_index :club_memberships, :member_id
    add_index :club_memberships, :club_id
  end
end
