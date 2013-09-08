class CreateCentersUsersJoinTable < ActiveRecord::Migration
 def self.up
    create_table :centers_users, :id => false do |t|
      t.integer :center_id
      t.integer :user_id
    end

    add_index :centers_users, [:center_id, :user_id]
  end

  def self.down
    drop_table :centers_users
  end
end
