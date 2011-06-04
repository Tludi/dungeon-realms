class AddModIdToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :mod_id, :integer
  end

  def self.down
    remove_column :rooms, :mod_id
  end
end
