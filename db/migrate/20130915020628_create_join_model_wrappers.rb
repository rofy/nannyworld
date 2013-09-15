class CreateJoinModelWrappers < ActiveRecord::Migration
  def self.up
    create_table :wrappers do |t|
      t.column "center_id", :integer, :null => false
      t.column "user_id",   :integer, :null => false
      t.column "following", :boolean 
      t.column "enrolled",  :boolean
      t.column "ambassador",:boolean
      t.timestamps
    end    
  end

  def self.down
     drop_table :wrappers
  end
end
