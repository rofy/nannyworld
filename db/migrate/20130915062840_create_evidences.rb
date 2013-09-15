class CreateEvidences < ActiveRecord::Migration
   def self.up  
      create_table(:evidences) do |t|
        t.integer :wrapper_id
        t.timestamps
      end
      add_attachment :evidences, :media
   end

   def self.down
      #remove_attachment :evidences, :media
      drop_table :evidences
   end
end
