class AddDescriptionToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :description, :string
    add_column :rooms, :room_number, :integer
    add_column :rooms, :north_exit, :integer
    add_column :rooms, :south_exit, :integer
    add_column :rooms, :east_exit, :integer
    add_column :rooms, :west_exit, :integer
  end

  def self.down
    remove_column :rooms, :west_exit
    remove_column :rooms, :east_exit
    remove_column :rooms, :south_exit
    remove_column :rooms, :north_exit
    remove_column :rooms, :room_number
    remove_column :rooms, :description
  end
end
