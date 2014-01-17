class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :leader_id
      t.string :club_name
      t.string :club_type

      t.timestamps
    end
    add_index :clubs, :leader_id
    add_index :clubs, :club_type
  end
end
