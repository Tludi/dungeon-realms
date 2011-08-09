class CreateBattles < ActiveRecord::Migration
  def self.up
    create_table :battles do |t|
      t.string :name
      t.integer :room_id

      t.timestamps
    end
  end

  def self.down
    drop_table :battles
  end
end
