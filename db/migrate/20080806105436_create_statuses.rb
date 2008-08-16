class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :name
      t.string :status
      t.integer :number
      t.string :lang
      t.string :ident_name
            
      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
