class AddRequestedToWrappers < ActiveRecord::Migration
  def self.up
    add_column :wrappers, :requested, :boolean    
  end

  def self.down
    remove_column :wrappers, :requested
  end
end
