class CreateActivityStreams < ActiveRecord::Migration
  def change
    create_table :activity_streams do |t|
      t.integer :user_id
      t.integer :club_id
      t.string :url
      t.string :activity_verb
      t.string :activity_object

      t.timestamps
    end
    add_index :activity_streams, :user_id
    add_index :activity_streams, :club_id
    add_index :activity_streams, :activity_verb
    add_index :activity_streams, :activity_object
  end
end
