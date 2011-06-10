class CreateMonsters < ActiveRecord::Migration
  def self.up
    create_table :monsters do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.integer :health
      t.integer :defence
      t.integer :damage
      t.integer :monster_number
      t.integer :treasure_type

      t.timestamps
    end
  end

  def self.down
    drop_table :monsters
  end
end
