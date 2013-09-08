class RemoveUserIfFromCenters < ActiveRecord::Migration
  def self.up
     remove_column :centers, :user_id

  end

  def self.down
     add_column :centers, :user_id, :integer
    
  end
end
