class AddUserIdToCenters < ActiveRecord::Migration
  def self.up
     add_column :centers, :user_id, :integer
    
  end

  def self.down
    remove_column :centers, :user_id
  end
end
