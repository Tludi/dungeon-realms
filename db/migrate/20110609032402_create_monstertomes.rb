class CreateMonstertomes < ActiveRecord::Migration
  def self.up
    create_table :monstertomes do |t|
      t.string :name
      t.integer :room_id
      t.integer :monster_id

      t.timestamps
    end
  end

  def self.down
    drop_table :monstertomes
  end
end
