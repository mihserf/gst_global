class CreateMemberStatuses < ActiveRecord::Migration
  def self.up
    create_table :member_statuses do |t|
      t.integer :member_id
      t.integer :status_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :member_statuses
  end
end
