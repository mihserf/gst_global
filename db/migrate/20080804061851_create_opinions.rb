class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.string :author
      t.string :status, :lang
      t.text :body
      t.integer :city_id
      t.integer :ident_num
      t.string :ident_name

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
