class AddMonstersToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :monster1, :integer
    add_column :rooms, :monster2, :integer
    add_column :rooms, :monster3, :integer
    add_column :rooms, :monster4, :integer
    add_column :rooms, :monster5, :integer
  end

  def self.down
    remove_column :rooms, :monster5
    remove_column :rooms, :monster4
    remove_column :rooms, :monster3
    remove_column :rooms, :monster2
    remove_column :rooms, :monster1
  end
end
