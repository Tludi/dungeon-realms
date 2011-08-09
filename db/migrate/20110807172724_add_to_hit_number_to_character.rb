class AddToHitNumberToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :to_hit, :integer
    add_column :characters, :fatigue, :integer
    add_column :characters, :endurance, :integer
    add_column :characters, :strength, :integer
    add_column :monsters, :to_hit, :integer
  end

  def self.down
    remove_column :characters, :to_hit
    remove_column :characters, :fatigue, :integer
    remove_column :characters, :endurance, :integer
    remove_column :characters, :strength, :integer
    remove_column :monsters, :to_hit, :integer
  end
end
