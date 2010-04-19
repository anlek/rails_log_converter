class EntryMigration < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :controller,
               :action, 
               :ip, 
               :method, 
               :session_id, 
               :cookie_set, 
               :url
               
      t.integer :req_per_sec, 
                :html_code
                
      t.decimal :completed_time, 
                :database_time
                
      t.text    :parameters, :other
      
      t.datetime :date
                
               
    end
  end

  def self.down
    drop_table :entries
  end
end
