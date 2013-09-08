class AddNameAndContactToCenters < ActiveRecord::Migration
  def self.up
     add_column :centers, :name, :string
     add_column :centers, :contact, :string
  end

  def self.down
     remove_column :centers, :name
     remove_column :centers, :contact
  end

end
