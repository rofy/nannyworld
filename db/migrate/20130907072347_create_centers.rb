class CreateCenters < ActiveRecord::Migration
  def self.up
    create_table :centers do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :centers
  end
end
