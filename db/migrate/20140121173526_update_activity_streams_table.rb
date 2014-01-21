class UpdateActivityStreamsTable < ActiveRecord::Migration
  def change
    add_column :activity_streams, :username, :string
    add_column :activity_streams, :first_name, :string
    add_column :activity_streams, :last_name, :string
    add_column :activity_streams, :club_name, :string
    add_column :activity_streams, :image_url, :string
  end

end
