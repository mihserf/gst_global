class AddIdentNumToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :ident_num, :integer
  end

  def self.down
    remove_column :statuses, :ident_num
  end
end
