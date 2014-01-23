class RemoveNotNullOnEmail < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :null => true
    change_column :users, :last_name, :string, :null => true
  end
end
