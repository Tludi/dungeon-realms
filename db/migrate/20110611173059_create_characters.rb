class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.string :char_class
      t.string :race
      t.integer :level
      t.integer :health
      t.integer :energy
      t.integer :experience
      t.integer :damage
      t.integer :defense
      t.integer :gold
      t.integer :platinum
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
